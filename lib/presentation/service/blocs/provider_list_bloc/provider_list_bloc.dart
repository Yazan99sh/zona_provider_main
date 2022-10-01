import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/domain/service/entities/provider.dart';
import 'package:zona_provider_main/domain/service/usecases/provider_list_use_case.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

part 'provider_list_event.dart';

@injectable
class ProviderListBloc
    extends Bloc<ProviderListEvent, BaseState<List<Provider>>> {
  final ProviderListUseCase providerListUseCase;

  ProviderListBloc(
    this.providerListUseCase,
  ) : super(const BaseState()) {
    on<ProviderListRequested>(
      (event, emit) async {
        emit(state.setInProgressState());

        final result = await providerListUseCase(NoParams());
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
