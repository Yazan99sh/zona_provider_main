import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/auth/repositories/auth_repository.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/domain/user/entities/my_Profile.dart';

@lazySingleton
class GetMineUseCase extends UseCase<MyProfile?, NoParams> {
  final AuthRepository authRepository;

  GetMineUseCase(this.authRepository);
  @override
  Future<Either<Failure, MyProfile?>> call(NoParams params) {
    return authRepository.getMine();
  }
}
