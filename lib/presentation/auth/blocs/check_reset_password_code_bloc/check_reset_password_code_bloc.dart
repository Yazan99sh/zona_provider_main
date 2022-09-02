import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/auth/usecases/check_reset_password_code_use_case.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

part 'check_reset_password_code_event.dart';

@injectable
class CheckResetPasswordCodeBloc
    extends Bloc<CheckResetPasswordCodeEvent, BaseState> {
  final CheckResetPasswordCodeUseCase checkResetPasswordCodeUseCase;

  CheckResetPasswordCodeBloc(this.checkResetPasswordCodeUseCase)
      : super(const BaseState()) {
    on<CheckResetPasswordCodeRequested>(
      (event, emit) async {
        emit(const BaseState(status: BaseStatus.inProgress));
        final result = await checkResetPasswordCodeUseCase.call(event.resetPasswordCode);
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
