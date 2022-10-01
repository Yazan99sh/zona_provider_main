import 'package:dartz/dartz.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/domain/service/entities/enums/service_filter.dart';
import 'package:zona_provider_main/domain/service/entities/service.dart';
import 'package:zona_provider_main/domain/service/repositories/service_repository.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class ServiceListUseCase
    extends UseCase<List<Service>, ServiceFilter> {
  final ServiceRepository repository;

  ServiceListUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Service>>> call(
      ServiceFilter params) {
    return repository.getServices(
      serviceFilter:  params,
    );
  }
}


