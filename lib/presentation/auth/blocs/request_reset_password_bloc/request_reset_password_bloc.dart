import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/auth/usecases/rquest_reset_password_use_case.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

part 'request_reset_password_event.dart';

@injectable
class RequestResetPasswordBloc
    extends Bloc<RequestResetPasswordEvent, BaseState> {
  final RequestResetPasswordUseCase requestResetPasswordUseCase;

  RequestResetPasswordBloc(this.requestResetPasswordUseCase)
      : super(const BaseState()) {
    on<RequestResetPasswordRequested>(
      (event, emit) async {
        emit(const BaseState(status: BaseStatus.inProgress));
        final result = await requestResetPasswordUseCase.call(event.email);
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
