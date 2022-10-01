import 'package:dartz/dartz.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/domain/service/entities/provider.dart';
import 'package:zona_provider_main/domain/service/repositories/service_repository.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class ProviderListUseCase extends UseCase<List<Provider>, NoParams> {
  final ServiceRepository repository;

  ProviderListUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Provider>>> call(params) {
    return repository.getAllProviders();
  }
}
