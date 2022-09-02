import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/auth/usecases/reset_password_use_case.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

part 'reset_password_event.dart';

@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, BaseState> {
  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordBloc(this.resetPasswordUseCase) : super(const BaseState()) {
    on<ResetPasswordRequested>(
      (event, emit) async {
        emit(const BaseState(status: BaseStatus.inProgress));
        final result = await resetPasswordUseCase.call(
          ResetPasswordUseCaseParams(
              resetPasswordCode: event.resetPasswordCode,
              password: event.password,
              passwordConfirmation: event.passwordConfirmation),
        );
        emit(
          result.fold(
            (l) => state.setFailureState(l),
            (r) => state.setSuccessState(r),
          ),
        );
      },
    );
  }
}
