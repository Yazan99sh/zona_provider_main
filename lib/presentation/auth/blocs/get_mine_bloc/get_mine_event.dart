part of 'get_mine_bloc.dart';

abstract class GetMineEvent {}

class GetMineRequested extends GetMineEvent {}

class MineUpdated extends GetMineEvent {
  MyProfile user;

  MineUpdated({required this.user});
}
