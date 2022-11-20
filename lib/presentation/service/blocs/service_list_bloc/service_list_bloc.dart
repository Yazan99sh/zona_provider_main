import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/service/entities/enums/service_filter.dart';
import 'package:zona_provider_main/domain/service/entities/service.dart';
import 'package:zona_provider_main/domain/service/usecases/service_list_use_case.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';
import 'package:zona_provider_main/presentation/service/blocs/delete_service_bloc/delete_service_bloc.dart';

part 'service_list_event.dart';

@injectable
class ServiceListBloc extends Bloc<ServiceListEvent, BaseState<List<Service>>> {
  final ServiceListUseCase serviceListUseCase;
  final DeleteServiceBloc deleteServiceBloc;

  ServiceListBloc(
    this.serviceListUseCase,
    this.deleteServiceBloc,
  ) : super(const BaseState()) {
    deleteServiceBloc.stream.listen((event) {
      if (event.isSuccess) {
        add(ServiceListDelete(id: event.item!));
      }
    });
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
    on<ServiceListDelete>((event, emit) async {
      state.item!.removeWhere((element) => element.id == int.parse(event.id));
      emit(state.copyWith(item: state.item));
    });
  }
}
