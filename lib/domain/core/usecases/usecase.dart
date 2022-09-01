
import 'package:dartz/dartz.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
