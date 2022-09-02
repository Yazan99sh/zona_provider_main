part of 'reset_password_bloc.dart';

@immutable
abstract class ResetPasswordEvent {}

class ResetPasswordRequested extends ResetPasswordEvent {
  final String resetPasswordCode;
  final String password;
  final String passwordConfirmation;
  ResetPasswordRequested({
    required this.resetPasswordCode,
    required this.password,
    required this.passwordConfirmation,
  });
}
