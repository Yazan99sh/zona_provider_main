part of 'request_reset_password_bloc.dart';

@immutable
abstract class RequestResetPasswordEvent {}

class RequestResetPasswordRequested extends RequestResetPasswordEvent {
  final String email;

  RequestResetPasswordRequested({
    required this.email,
  });
}
