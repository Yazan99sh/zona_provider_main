part of 'provider_list_bloc.dart';

@immutable
abstract class ProviderListEvent {}

class ProviderListRequested extends ProviderListEvent {
  ProviderListRequested();
}
