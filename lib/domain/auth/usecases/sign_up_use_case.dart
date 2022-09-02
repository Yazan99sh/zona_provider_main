import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/auth/entities/user.dart';
import 'package:zona_provider_main/domain/auth/repositories/auth_repository.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/domain/user/entities/enums/gender.dart';

@lazySingleton
class SignUpUseCase
    extends UseCase<User, SignUpUseCaseParams> {
  final AuthRepository repository;

  SignUpUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, User>> call(params) async {
    return await repository.signUp(
      email: params.email,
      firstName: params.firstName,
      lastName: params.lastName,
      phone: params.phone,
      gender: params.gender,
      password: params.password,
      profileImage: params.profileImage,
      dateOfBirth: params.dateOfBirth,
    );
  }
}

class SignUpUseCaseParams {
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final Gender? gender;
  final String password;
  final File? profileImage;
  final DateTime? dateOfBirth;

  SignUpUseCaseParams({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.gender,
    required this.password,
    this.profileImage,
    this.dateOfBirth,
  });
}
