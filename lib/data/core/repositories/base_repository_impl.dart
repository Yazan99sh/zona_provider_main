import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/logger.dart';
import 'package:zona_provider_main/data/auth/datasources/local/auth_local_datasource.dart';
import 'package:zona_provider_main/data/auth/datasources/remote/auth_remote_datasource.dart';
import 'package:zona_provider_main/data/core/models/base_response/base_response.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/repositories/base_repository.dart';
import 'package:zona_provider_main/domain/core/utils/constants.dart';
import 'package:zona_provider_main/domain/core/utils/network/network_info.dart';
import 'package:zona_provider_main/injection.dart';

class BaseRepositoryImpl implements BaseRepository {
  final AuthRemoteDataSource _authRemote = getIt<AuthRemoteDataSource>();
  final AuthLocalDatasource authLocal = getIt<AuthLocalDatasource>();
  final NetworkInfo _networkInfo;
  final Logger _logger;

  BaseRepositoryImpl(this._networkInfo, this._logger);

  @override
  Future<Either<Failure, T>> request<T>(FutureEitherFailureOrData<T> body,
      {bool checkToken = true}) async {
    try {
      if (!await _networkInfo.isConnected) {
        return left(
            ServerFailure(errorCode: ServerErrorCode.noInternetConnection));
      }

      if (checkToken) {
        final user = authLocal.getSignedInUser();
        if (user != null) {
          if (_isTokenExpired(user.accessToken)) {
            final dio = getIt<Dio>();
            dio.options.headers['Authorization'] = 'Bearer ${user.accessToken}';
              // authLocal.authStatus.add(null);
              // authLocal.logout();
              // return left(
              //     ServerFailure(errorCode: ServerErrorCode.unauthenticated));
            final refreshTokenResponse =
                await _authRemote.refreshToken();
            final refreshTokenData = refreshTokenResponse.data!;
            final newUser = user.copyWith(
                refreshTokenData.accessToken,
              );
            await authLocal.signInUser(newUser);
            dio.options.headers['Authorization'] = 'Bearer ${user.accessToken}';
          }
        }
      }
      return await body();
    } catch (e) {
      if (e is DioError) {
        _logger.e(e.message, e, e.stackTrace);

        var message = '';
        var errorCode = ServerErrorCode.serverError;

        if (e.response != null) {
          errorCode = _getErrorCode(e.response!.statusCode ?? 500);

          try {
            final responseData = e.response!.data is String
                ? jsonDecode(e.response!.data)
                : e.response!.data;
            final baseResponse =
                BaseResponse.fromJson(responseData, (_) => null);
            message = baseResponse.message ?? '';
            if (baseResponse.code != null) {
              errorCode = _getErrorCodeFromCode(baseResponse.code!.toString());
            }
          } catch (e) {
            return left(ServerFailure(errorCode: errorCode, message: message));
          }
        }

        return left(ServerFailure(errorCode: errorCode, message: message));
      } else if (e is Error) {
        _logger.e(e.toString(), e, e.stackTrace);
      } else {
        _logger.e(e);
      }

      return left(ServerFailure(errorCode: ServerErrorCode.serverError));
    }
  }

  bool _isTokenExpired(String token) {
    final DateTime expiryDate = JwtDecoder.getExpirationDate(token);
    final now = DateTime.now();
    return expiryDate.compareTo(now) < 0;
  }

  ServerErrorCode _getErrorCode(int statusCode) {
    switch (statusCode) {
      case 401:
        return ServerErrorCode.unauthenticated;
      case 404:
        return ServerErrorCode.notFound;
      case 403:
        return ServerErrorCode.forbidden;
      case 400:
        return ServerErrorCode.invalidData;
      case 422:
        return ServerErrorCode.wrongInput;
      default:
        return ServerErrorCode.serverError;
    }
  }

  ServerErrorCode _getErrorCodeFromCode(String code) {
    switch (int.parse(code)) {
      default:
        return ServerErrorCode.serverError;
    }
  }
}
