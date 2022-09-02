import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:zona_provider_main/data/auth/datasources/local/auth_local_datasource.dart';
import 'package:zona_provider_main/data/auth/datasources/remote/auth_remote_datasource.dart';
import 'package:zona_provider_main/data/auth/models/user_model/user_model.dart';
import 'package:zona_provider_main/data/core/repositories/base_repository_impl.dart';
import 'package:zona_provider_main/data/core/utils/configuration.dart';
import 'package:zona_provider_main/data/user/models/enums/gender_model.dart';
import 'package:zona_provider_main/domain/auth/entities/user.dart';
import 'package:zona_provider_main/domain/auth/repositories/auth_repository.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/utils/network/network_info.dart';
import 'package:zona_provider_main/domain/user/entities/enums/gender.dart';
import 'package:zona_provider_main/domain/user/entities/user_info.dart';
import 'package:zona_provider_main/data/user/models/user_info_model/user_info_model.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource local;
  final AuthRemoteDataSource remote;
  final NetworkInfo networkInfo;
  final Logger logger;
  final Configuration configuration;

  AuthRepositoryImpl(
    this.local,
    this.remote,
    this.networkInfo,
    this.logger,
    this.configuration,
  ) : super(networkInfo, logger);

  @override
  Future<Either<Failure, User?>> getSignedInUser() async {
    final UserModel? userModel = local.getSignedInUser();
    return right(userModel?.toDomain());
  }

  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    return request(
      () async {
        var userResponse = await remote.login(email: email, password: password);
        local.signInUser(userResponse.data!);
        local.authStatus.add(userResponse.data!.userInfo);
        return right(userResponse.data!.toDomain());
      },
      checkToken: false,
    );
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    local.logout();
    local.authStatus.add(null);
    return right(unit);
  }

  @override
  Future<Either<Failure, Stream<UserInfo?>>> subscribeToAuthStatus() async {
    return right(local.authStatus.stream.map((event) => event?.toDomain()));
  }

  @override
  Future<Either<Failure, bool>> getIsFirstTimeLogged() async {
    return right(local.getIsFirstTimeLogged());
  }

  @override
  Future<Either<Failure, void>> setFirstTimeLogged(bool firstTimeLogged) async {
    return right(local.setFirstTimeLogged(firstTimeLogged));
  }

  @override
  Future<Either<Failure, User>> signUp(
      {required String email,
      required String firstName,
      required String lastName,
      required String phone,
      Gender? gender,
      required String password,
      File? profileImage,
      DateTime? dateOfBirth}) {
    return request(() async {
      final result = await remote.signUp(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        gender: genderModelFromDomainString(gender),
        password: password,
        profileImage: profileImage,
        dateOfBirth: dateOfBirth != null
            ? DateFormat("yyyy-MM-dd hh:mm:ss").format(dateOfBirth)
            : null,
      );
      local.signInUser(result.data!);
      local.authStatus.add(result.data!.userInfo);
      return right(result.data!.toDomain());
    });
  }

  @override
  Future<Either<Failure, BaseState>> requestResetPassword({
    required String email,
  }) {
    return request(() async {
      final result = await remote.requestResetPassword(
        email: email,
      );
      return right(result.data);
    });
  }

  @override
  Future<Either<Failure, BaseState>> checkResetPasswordCode({
    required String resetPasswordCode,
  }) {
    return request(() async {
      final result = await remote.checkResetPasswordCode(
        resetPasswordCode: resetPasswordCode,
      );
      return right(result.data);
    });
  }  @override
  Future<Either<Failure, BaseState>> resetPassword({
    required String resetPasswordCode,
    required String password,
    required String passwordConfirmation,
  }) {
    return request(() async {
      final result = await remote.resetPassword(
        resetPasswordCode: resetPasswordCode,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      return right(result.data);
    });
  }
}
