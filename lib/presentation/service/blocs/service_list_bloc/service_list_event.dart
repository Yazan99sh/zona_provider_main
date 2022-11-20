part of 'service_list_bloc.dart';

@immutable
abstract class ServiceListEvent {}

class ServiceListRequested extends ServiceListEvent {
  final ServiceFilter serviceFilter;

  ServiceListRequested({
    required this.serviceFilter,
  });
}
class ServiceListDelete extends ServiceListEvent {
  final String id;

  ServiceListDelete({
    required this.id,
  });
}