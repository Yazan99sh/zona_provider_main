
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/auth/usecases/get_mine_use_case.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/domain/user/entities/my_Profile.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

part 'get_mine_event.dart';

@injectable
class GetMineBloc extends Bloc<GetMineEvent, BaseState<MyProfile>> {
  final GetMineUseCase getMineUseCase;

  GetMineBloc(this.getMineUseCase) : super(const BaseState()) {
    on<GetMineRequested>((event, emit) async {
      emit(const BaseState(status: BaseStatus.inProgress));
      final result = await getMineUseCase.call(NoParams());
      result.fold(
        (l) => emit(state.setFailureState(l)),
        (userInfo) =>
            emit(BaseState(status: BaseStatus.success, item: userInfo)),
      );
    });

    on<MineUpdated>((event, emit) async {
      emit(BaseState(status: BaseStatus.success, item: event.user));
    });
  }
}
