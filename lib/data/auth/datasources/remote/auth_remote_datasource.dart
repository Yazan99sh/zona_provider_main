import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zona_provider_main/data/auth/models/user_model/user_model.dart';
import 'package:zona_provider_main/data/core/models/base_response/base_response.dart';
import 'package:zona_provider_main/data/core/utils/configuration.dart';
import 'package:http_parser/http_parser.dart';
import 'package:zona_provider_main/data/user/models/my_profile_model/my_profile_model.dart';

part 'auth_remote_datasource.g.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<UserModel>> login({
    required String email,
    required String password,
  });

  Future<MyProfileModel> getMine({
    required int id,
  });

  Future<BaseResponse<UserModel>> refreshToken();

  Future<BaseResponse<UserModel>> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    String? gender,
    required String password,
    File? profileImage,
    String? dateOfBirth,
  });

  Future<MyProfileModel> updateProfile({
    required int id,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
     String? gender,
    File? profileImage,
    String? dateOfBirth,
  });

  Future<BaseResponse> requestResetPassword({
    required String email,
  });

  Future<BaseResponse> checkResetPasswordCode({
    required String resetPasswordCode,
  });

  Future<BaseResponse> resetPassword({
    required String resetPasswordCode,
    required String password,
    required String passwordConfirmation,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
@RestApi(baseUrl: '')
abstract class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSourceImpl(Dio dio, Configuration configuration) {
    return _AuthRemoteDataSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @override
  @POST('/public/api/auth/login')
  @FormUrlEncoded()
  Future<BaseResponse<UserModel>> login({
    @Part() required String email,
    @Part() required String password,
  });

  @override
  @POST('/api/auth/get_user_data')
  @FormUrlEncoded()
  Future<MyProfileModel> getMine({
    @Part() required int id,
  });

  @override
  @POST('/public/api/auth/refresh-token')
  Future<BaseResponse<UserModel>> refreshToken();

  @override
  @POST('/public/api/auth/register')
  @FormUrlEncoded()
  Future<BaseResponse<UserModel>> signUp({
    @Part() required String email,
    @Part(name: 'first_name') required String firstName,
    @Part(name: 'last_name') required String lastName,
    @Part() required String phone,
    @Part() String? gender,
    @Part() required String password,
    @Part(name: 'profileImage', contentType: 'application/jpg')
        File? profileImage,
    @Part(name: 'date_of_birth') String? dateOfBirth,
  });

  @override
  @POST('/api/auth/update_user_data')
  @FormUrlEncoded()
  Future<MyProfileModel> updateProfile({
    @Part() required int id,
    @Part() required String email,
    @Part(name: 'first_name') required String firstName,
    @Part(name: 'last_name') required String lastName,
    @Part() required String phone,
    @Part()  String? gender,
    @Part(name: 'profileImage', contentType: 'application/jpg')
        File? profileImage,
    @Part(name: 'date_of_birth') String? dateOfBirth,
  });

  @override
  @POST('/public/api/auth/request-reset-password')
  @FormUrlEncoded()
  Future<BaseResponse> requestResetPassword({
    @Part(name: 'email') required String email,
  });

  @override
  @POST('/public/api/auth/check-reset-password-code')
  @FormUrlEncoded()
  Future<BaseResponse> checkResetPasswordCode({
    @Part(name: 'reset_password_code') required String resetPasswordCode,
  });

  @override
  @POST('/public/api/auth/reset-password')
  @FormUrlEncoded()
  Future<BaseResponse> resetPassword({
    @Part(name: 'reset_password_code') required String resetPasswordCode,
    @Part(name: 'password') required String password,
    @Part(name: 'password_confirmation') required String passwordConfirmation,
  });
}
