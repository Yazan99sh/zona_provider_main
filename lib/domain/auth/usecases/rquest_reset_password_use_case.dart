import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/auth/repositories/auth_repository.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

@lazySingleton
class RequestResetPasswordUseCase extends UseCase<BaseState, String> {
  final AuthRepository repository;

  RequestResetPasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, BaseState>> call(params) async {
    return await repository.requestResetPassword(email: params);
  }
}
