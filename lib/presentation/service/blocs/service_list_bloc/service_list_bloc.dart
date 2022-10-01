import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/service/entities/enums/service_filter.dart';
import 'package:zona_provider_main/domain/service/entities/service.dart';
import 'package:zona_provider_main/domain/service/usecases/service_list_use_case.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

part 'service_list_event.dart';

@injectable
class ServiceListBloc extends Bloc<ServiceListEvent, BaseState<List<Service>>> {
  final ServiceListUseCase serviceListUseCase;

  ServiceListBloc(
    this.serviceListUseCase,
  ) : super(const BaseState()) {
    on<ServiceListRequested>(
      (event, emit) async {
        emit(state.setInProgressState());

        final result = await serviceListUseCase(
          event.serviceFilter,
        );
        result.fold(
          (l) => emit(state.setFailureState(l)),
          (r) {
            emit(
              state.setSuccessState(r),
            );
          },
        );
      },
    );
  }
}
