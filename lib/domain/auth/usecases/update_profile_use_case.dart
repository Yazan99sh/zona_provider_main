import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/auth/repositories/auth_repository.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/domain/user/entities/enums/gender.dart';
import 'package:zona_provider_main/domain/user/entities/my_Profile.dart';

@lazySingleton
class UpdateProfileUseCase
    extends UseCase<MyProfile, UpdateProfileUseCaseParams> {
  final AuthRepository repository;

  UpdateProfileUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, MyProfile>> call(params) async {
    return await repository.updateProfile(
      email: params.email,
      firstName: params.firstName,
      lastName: params.lastName,
      phone: params.phone,
      gender: params.gender,
      profileImage: params.profileImage,
      dateOfBirth: params.dateOfBirth,
    );
  }
}

class UpdateProfileUseCaseParams {
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final Gender? gender;
  final File? profileImage;
  final DateTime? dateOfBirth;

  UpdateProfileUseCaseParams({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.gender,
    this.profileImage,
    this.dateOfBirth,
  });
}
