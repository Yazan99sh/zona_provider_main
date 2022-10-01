import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/domain/service/repositories/service_repository.dart';

@lazySingleton
class DeleteServiceUseCase extends UseCase<String, String> {
  final ServiceRepository repository;

  DeleteServiceUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.deleteService(id: params);
  }
}
