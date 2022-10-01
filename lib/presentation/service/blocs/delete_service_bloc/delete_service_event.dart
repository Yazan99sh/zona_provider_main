part of 'delete_service_bloc.dart';

@immutable
abstract class DeleteServiceEvent {}

class DeleteServiceRequested extends DeleteServiceEvent {
  final String serviceId;

  DeleteServiceRequested({
    required this.serviceId,
  });
}
