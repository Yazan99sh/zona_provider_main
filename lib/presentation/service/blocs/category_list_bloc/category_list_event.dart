part of 'category_list_bloc.dart';

@immutable
abstract class CategoryListEvent {}

class CategoryListRequested extends CategoryListEvent {
  CategoryListRequested();
}
