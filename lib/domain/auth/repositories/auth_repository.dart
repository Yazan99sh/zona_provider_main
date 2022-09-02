import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:zona_provider_main/domain/auth/entities/user.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/user/entities/enums/gender.dart';
import 'package:zona_provider_main/domain/user/entities/user_info.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

abstract class AuthRepository {
  Future<Either<Failure, User?>> getSignedInUser();

  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, Stream<UserInfo?>>> subscribeToAuthStatus();

  Future<Either<Failure, bool>> getIsFirstTimeLogged();

  Future<Either<Failure, void>> setFirstTimeLogged(bool firstTimeLogged);

  Future<Either<Failure, User>> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    Gender? gender,
    required String password,
    File? profileImage,
    DateTime? dateOfBirth,
  });

  Future<Either<Failure, BaseState>> requestResetPassword({
    required String email,
  });

  Future<Either<Failure, BaseState>> checkResetPasswordCode({
    required String resetPasswordCode,
  });

  Future<Either<Failure, BaseState>> resetPassword({
    required String resetPasswordCode,
    required String password,
    required String passwordConfirmation,
  });
}
