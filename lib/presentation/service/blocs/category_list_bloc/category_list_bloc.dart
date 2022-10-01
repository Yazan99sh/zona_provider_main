import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/domain/service/entities/category.dart';
import 'package:zona_provider_main/domain/service/usecases/category_list_use_case.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

part 'category_list_event.dart';

@injectable
class CategoryListBloc extends Bloc<CategoryListEvent, BaseState<List<Category>>> {
  final CategoryListUseCase categoryListUseCase;

  CategoryListBloc(
    this.categoryListUseCase,
  ) : super(const BaseState()) {
    on<CategoryListRequested>(
      (event, emit) async {
        emit(state.setInProgressState());

        final result = await categoryListUseCase(NoParams());
        result.fold(
          (l) => emit(state.setFailureState(l)),
          (r) {
            emit(
              state.setSuccessState(r),
            );
          },
        );
      },
    );
  }
}
