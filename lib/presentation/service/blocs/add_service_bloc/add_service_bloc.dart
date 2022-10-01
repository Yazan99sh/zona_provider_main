import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/service/usecases/add_service_use_case.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

part 'add_service_event.dart';

@LazySingleton()
class AddServiceBloc extends Bloc<AddServiceEvent, BaseState<String>> {
  final AddServiceUseCase addServiceUseCase;

  AddServiceBloc(this.addServiceUseCase) : super(const BaseState()) {
    on<AddServiceRequested>(
      (event, emit) async {
        emit(state.setInProgressState());
        final result = await addServiceUseCase.call(AddServiceUseCaseParams(
          name: event.name,
          description: event.description,
          price: event.price,
          idCategory: event.idCategory,
          address: event.address,
          totalPrice: event.totalPrice,
          idProvider: event.idProvider,
          isColor: event.isColor,
          status: event.status,
          image: event.image,
        ));

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
