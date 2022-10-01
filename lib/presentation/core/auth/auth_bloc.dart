import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:zona_provider_main/domain/auth/usecases/get_first_time_logged_use_case.dart';
import 'package:zona_provider_main/domain/auth/usecases/get_mine_use_case.dart';

//import 'package:zona_provider_main/domain/auth/usecases/get_mine_use_case.dart';
import 'package:zona_provider_main/domain/auth/usecases/get_signed_in_user_use_case.dart';
import 'package:zona_provider_main/domain/auth/usecases/logout_use_case.dart';
import 'package:zona_provider_main/domain/auth/usecases/set_first_time_logged_use_case.dart';
import 'package:zona_provider_main/domain/auth/usecases/subscribe_to_auth_status.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/domain/user/entities/user_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetSignedInUserUseCase getSignedInUserUseCase;

  final GetMineUseCase getMineUseCase;
  final LogoutUseCase logoutUseCase;
  final SubscribeToAuthStatusUseCase subscribeToAuthStatusUseCase;
  final GetFirstTimeLoggedUseCase getFirstTimeLogged;
  final SetFirstTimeLoggedUseCase setFirstTimeLogged;

  AuthBloc(
      this.getSignedInUserUseCase,
      this.getMineUseCase,
      this.logoutUseCase,
      this.subscribeToAuthStatusUseCase,
      this.getFirstTimeLogged,
      this.setFirstTimeLogged)
      : super(AuthInitial()) {
    on<AuthSetFirstTimeLogged>(
      (event, emit) {
        setFirstTimeLogged(SetFirstTimeLoggedUseCaseParams(
            isFirstTimeLogged: event.isFirstTimeLogged));
      },
    );
    on<AuthCheckRequested>(
      (event, emit) async {
        emit(AuthLoading());
        final result = await getSignedInUserUseCase.call(NoParams());
        final result2 = await getFirstTimeLogged(NoParams());
        await result.fold((l) async {
          emit(AuthFailure(l));
        }, (user) async {
          if (user != null) {
            final result1 = await getMineUseCase.call(NoParams());
            await result1.fold((failure) async {}, (user) async {
              emit(
                Authenticated(
                  user: UserInfo(
                    id: user!.data!.id,
                    name: user.data!.name,
                    phone: user.data!.phone,
                    email: user.data!.email,
                    lastName: user.data!.lastName,
                    firstName: user.data!.firstName,
                    profileImage: user.data!.profileImage,
                    dateOfBirth: user.data!.dateOfBirth,
                    gender: user.data!.gender,
                  ),
                ),
              );
            });
          } else {
            return result2.fold(
              (l) => emit(AuthFailure(l)),
              (r) => emit(
                Unauthenticated(r),
              ),
            );
          }
        });
      },
    );

    on<SubscribeToAuthStatus>((event, emit) async {
      final result = await subscribeToAuthStatusUseCase.call(NoParams());
      await result.fold(
        (l) => null,
        (authStatus) async {
          await emit.onEach<UserInfo?>(
            authStatus,
            onData: (user) {
              if (user == null) {
                emit(Unauthenticated(false));
              } else {
                if (state is Authenticated) {
                  emit(
                    Authenticated(
                      user: user,
                    ),
                  );
                } else {
                  add(AuthLogin(user));
                }
              }
            },
          );
        },
      );
    }, transformer: restartable());

    on<AuthUpdateUser>(
      (event, emit) async {
        emit(
          Authenticated(
            user: (state as Authenticated).user.copyWith(
                  firstName: event.user.firstName,
                  lastName: event.user.lastName,
                  phone: event.user.phone,
                  email: event.user.email,
                  dateOfBirth: event.user.dateOfBirth,
                  gender: event.user.gender,
                  profileImage: event.user.profileImage,
                ),
          ),
        );
      },
    );

    on<AuthLogin>((event, emit) async {
      emit(
        Authenticated(
          user: event.user,
        ),
      );
    });

    on<AuthLogout>(
      (event, emit) async {
        logoutUseCase.call(NoParams());
      },
    );
  }
}
