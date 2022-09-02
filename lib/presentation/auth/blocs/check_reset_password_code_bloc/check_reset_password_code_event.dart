part of 'check_reset_password_code_bloc.dart';

@immutable
abstract class CheckResetPasswordCodeEvent {}

class CheckResetPasswordCodeRequested extends CheckResetPasswordCodeEvent {
  final String resetPasswordCode;

  CheckResetPasswordCodeRequested({
    required this.resetPasswordCode,
  });
}
