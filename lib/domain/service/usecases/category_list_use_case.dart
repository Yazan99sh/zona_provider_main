import 'package:dartz/dartz.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/domain/service/entities/category.dart';
import 'package:zona_provider_main/domain/service/repositories/service_repository.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class CategoryListUseCase extends UseCase<List<Category>, NoParams> {
  final ServiceRepository repository;

  CategoryListUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Category>>> call(params) {
    return repository.getAllCategories();
  }
}
