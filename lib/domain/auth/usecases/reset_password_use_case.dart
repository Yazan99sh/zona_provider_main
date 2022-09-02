import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/auth/repositories/auth_repository.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

@lazySingleton
class ResetPasswordUseCase extends UseCase<BaseState, ResetPasswordUseCaseParams> {
  final AuthRepository repository;

  ResetPasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, BaseState>> call(
      ResetPasswordUseCaseParams params) async {
    return await repository.resetPassword(
      resetPasswordCode: params.resetPasswordCode,
      password: params.password,
      passwordConfirmation: params.passwordConfirmation,
    );
  }
}

class ResetPasswordUseCaseParams {
  final String resetPasswordCode;
  final String password;
  final String passwordConfirmation;

  ResetPasswordUseCaseParams({
    required this.resetPasswordCode,
    required this.password,
    required this.passwordConfirmation,
  });
}
