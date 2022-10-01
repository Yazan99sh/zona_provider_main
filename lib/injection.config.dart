// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import 'data/auth/datasources/local/auth_local_datasource.dart' as _i10;
import 'data/auth/datasources/remote/auth_remote_datasource.dart' as _i11;
import 'data/auth/repositories/auth_repository_impl.dart' as _i13;
import 'data/core/utils/configuration.dart' as _i3;
import 'data/core/utils/network/network_info.dart' as _i8;
import 'domain/auth/repositories/auth_repository.dart' as _i12;
import 'domain/auth/usecases/check_reset_password_code_use_case.dart' as _i14;
import 'domain/auth/usecases/get_first_time_logged_use_case.dart' as _i15;
import 'domain/auth/usecases/get_mine_use_case.dart' as _i16;
import 'domain/auth/usecases/get_signed_in_user_use_case.dart' as _i17;
import 'domain/auth/usecases/login_use_case.dart' as _i18;
import 'domain/auth/usecases/logout_use_case.dart' as _i19;
import 'domain/auth/usecases/reset_password_use_case.dart' as _i21;
import 'domain/auth/usecases/rquest_reset_password_use_case.dart' as _i20;
import 'domain/auth/usecases/set_first_time_logged_use_case.dart' as _i22;
import 'domain/auth/usecases/sign_up_use_case.dart' as _i23;
import 'domain/auth/usecases/subscribe_to_auth_status.dart' as _i24;
import 'domain/auth/usecases/update_profile_use_case.dart' as _i25;
import 'domain/core/utils/network/network_info.dart' as _i7;
import 'injectable_module.dart' as _i34;
import 'presentation/auth/blocs/check_reset_password_code_bloc/check_reset_password_code_bloc.dart'
    as _i27;
import 'presentation/auth/blocs/get_mine_bloc/get_mine_bloc.dart' as _i28;
import 'presentation/auth/blocs/login/login_bloc.dart' as _i29;
import 'presentation/auth/blocs/request_reset_password_bloc/request_reset_password_bloc.dart'
    as _i30;
import 'presentation/auth/blocs/reset_password_bloc/reset_password_bloc.dart'
    as _i31;
import 'presentation/auth/blocs/sign_up_bloc/sign_up_bloc.dart' as _i32;
import 'presentation/auth/blocs/update_profile_up_bloc/update_profile_bloc.dart'
    as _i33;
import 'presentation/core/auth/auth_bloc.dart' as _i26;

const String _dev = 'dev';
const String _staging = 'staging';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Configuration>(() => _i3.DevConfiguration(),
      registerFor: {_dev});
  gh.lazySingleton<_i3.Configuration>(() => _i3.StagingConfiguration(),
      registerFor: {_staging});
  gh.lazySingleton<_i3.Configuration>(() => _i3.ProductionConfiguration(),
      registerFor: {_prod});
  gh.lazySingleton<_i4.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i5.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.lazySingleton<_i6.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i8.NetworkInfoImpl(get<_i5.InternetConnectionChecker>()));
  await gh.lazySingletonAsync<_i9.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true);
  gh.lazySingleton<_i10.AuthLocalDatasource>(
      () => _i10.AuthLocalDatasourceImpl(get<_i9.SharedPreferences>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i11.AuthRemoteDataSource>(() =>
      _i11.AuthRemoteDataSourceImpl(get<_i4.Dio>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i12.AuthRepository>(() => _i13.AuthRepositoryImpl(
      get<_i10.AuthLocalDatasource>(),
      get<_i11.AuthRemoteDataSource>(),
      get<_i7.NetworkInfo>(),
      get<_i6.Logger>(),
      get<_i3.Configuration>()));
  gh.lazySingleton<_i14.CheckResetPasswordCodeUseCase>(() =>
      _i14.CheckResetPasswordCodeUseCase(
          repository: get<_i12.AuthRepository>()));
  gh.lazySingleton<_i15.GetFirstTimeLoggedUseCase>(
      () => _i15.GetFirstTimeLoggedUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i16.GetMineUseCase>(
      () => _i16.GetMineUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i17.GetSignedInUserUseCase>(
      () => _i17.GetSignedInUserUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i18.LoginUseCase>(
      () => _i18.LoginUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i19.LogoutUseCase>(
      () => _i19.LogoutUseCase(repository: get<_i12.AuthRepository>()));
  gh.lazySingleton<_i20.RequestResetPasswordUseCase>(() =>
      _i20.RequestResetPasswordUseCase(repository: get<_i12.AuthRepository>()));
  gh.lazySingleton<_i21.ResetPasswordUseCase>(
      () => _i21.ResetPasswordUseCase(repository: get<_i12.AuthRepository>()));
  gh.lazySingleton<_i22.SetFirstTimeLoggedUseCase>(
      () => _i22.SetFirstTimeLoggedUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i23.SignUpUseCase>(
      () => _i23.SignUpUseCase(repository: get<_i12.AuthRepository>()));
  gh.lazySingleton<_i24.SubscribeToAuthStatusUseCase>(
      () => _i24.SubscribeToAuthStatusUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i25.UpdateProfileUseCase>(
      () => _i25.UpdateProfileUseCase(repository: get<_i12.AuthRepository>()));
  gh.factory<_i26.AuthBloc>(() => _i26.AuthBloc(
      get<_i17.GetSignedInUserUseCase>(),
      get<_i16.GetMineUseCase>(),
      get<_i19.LogoutUseCase>(),
      get<_i24.SubscribeToAuthStatusUseCase>(),
      get<_i15.GetFirstTimeLoggedUseCase>(),
      get<_i22.SetFirstTimeLoggedUseCase>()));
  gh.factory<_i27.CheckResetPasswordCodeBloc>(() =>
      _i27.CheckResetPasswordCodeBloc(
          get<_i14.CheckResetPasswordCodeUseCase>()));
  gh.factory<_i28.GetMineBloc>(
      () => _i28.GetMineBloc(get<_i16.GetMineUseCase>()));
  gh.factory<_i29.LoginBloc>(
      () => _i29.LoginBloc(login: get<_i18.LoginUseCase>()));
  gh.factory<_i30.RequestResetPasswordBloc>(() =>
      _i30.RequestResetPasswordBloc(get<_i20.RequestResetPasswordUseCase>()));
  gh.factory<_i31.ResetPasswordBloc>(
      () => _i31.ResetPasswordBloc(get<_i21.ResetPasswordUseCase>()));
  gh.factory<_i32.SignUpBloc>(() => _i32.SignUpBloc(get<_i23.SignUpUseCase>()));
  gh.factory<_i33.UpdateProfileBloc>(
      () => _i33.UpdateProfileBloc(get<_i25.UpdateProfileUseCase>()));
  return get;
}

class _$InjectableModule extends _i34.InjectableModule {}
