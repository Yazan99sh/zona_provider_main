import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/service/usecases/update_user_use_case.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

part 'update_service_event.dart';

@LazySingleton()
class UpdateServiceBloc extends Bloc<UpdateServiceEvent, BaseState<String>> {
  final UpdateServiceUseCase updateServiceUseCase;

  UpdateServiceBloc(this.updateServiceUseCase) : super(const BaseState()) {
    on<UpdateServiceRequested>(
      (event, emit) async {
        emit(state.setInProgressState());
        final result =
            await updateServiceUseCase.call(UpdateServiceUseCaseParams(
          id: event.id,
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
          rate: event.rate,
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
