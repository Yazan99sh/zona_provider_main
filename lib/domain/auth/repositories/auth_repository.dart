import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';

abstract class AuthRepository {


  Future<Either<Failure, bool>> getIsFirstTimeLogged();

  Future<Either<Failure, void>> setFirstTimeLogged(bool firstTimeLogged);

}
