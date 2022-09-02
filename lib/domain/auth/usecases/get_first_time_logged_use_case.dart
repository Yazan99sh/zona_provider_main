import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/auth/repositories/auth_repository.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';

@lazySingleton
class GetFirstTimeLoggedUseCase extends UseCase<bool?, NoParams> {
  final AuthRepository authRepository;

  GetFirstTimeLoggedUseCase(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return authRepository.getIsFirstTimeLogged();
  }
}
