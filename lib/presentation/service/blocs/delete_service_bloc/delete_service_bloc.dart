import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/service/usecases/delete_service_use_case.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

part 'delete_service_event.dart';

@LazySingleton()
class DeleteUserBloc extends Bloc<DeleteServiceEvent, BaseState<String>> {
  final DeleteServiceUseCase deleteServiceUseCase;

  DeleteUserBloc(this.deleteServiceUseCase) : super(const BaseState()) {
    on<DeleteServiceRequested>(
      (event, emit) async {
        emit(state.setInProgressState());
        final result = await deleteServiceUseCase.call(event.serviceId);
        emit(
          result.fold(
            (l) => state.setFailureState(l),
            (r) => BaseState(
              status: BaseStatus.success,
              item: event.serviceId,
            ),
          ),
        );
      },
    );
  }
}
