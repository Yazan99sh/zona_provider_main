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
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import 'data/auth/datasources/local/auth_local_datasource.dart' as _i15;
import 'data/auth/datasources/remote/auth_remote_datasource.dart' as _i16;
import 'data/auth/repositories/auth_repository_impl.dart' as _i18;
import 'data/core/utils/configuration.dart' as _i3;
import 'data/core/utils/network/network_info.dart' as _i8;
import 'data/service/datasources/remote/service_remote_datasource.dart' as _i9;
import 'data/service/repositories/service_repository_impl.dart' as _i11;
import 'domain/auth/repositories/auth_repository.dart' as _i17;
import 'domain/auth/usecases/check_reset_password_code_use_case.dart' as _i20;
import 'domain/auth/usecases/get_first_time_logged_use_case.dart' as _i23;
import 'domain/auth/usecases/get_mine_use_case.dart' as _i24;
import 'domain/auth/usecases/get_signed_in_user_use_case.dart' as _i25;
import 'domain/auth/usecases/login_use_case.dart' as _i26;
import 'domain/auth/usecases/logout_use_case.dart' as _i27;
import 'domain/auth/usecases/reset_password_use_case.dart' as _i30;
import 'domain/auth/usecases/rquest_reset_password_use_case.dart' as _i29;
import 'domain/auth/usecases/set_first_time_logged_use_case.dart' as _i32;
import 'domain/auth/usecases/sign_up_use_case.dart' as _i33;
import 'domain/auth/usecases/subscribe_to_auth_status.dart' as _i34;
import 'domain/auth/usecases/update_profile_use_case.dart' as _i35;
import 'domain/core/utils/network/network_info.dart' as _i7;
import 'domain/service/repositories/service_repository.dart' as _i10;
import 'domain/service/usecases/add_service_use_case.dart' as _i14;
import 'domain/service/usecases/category_list_use_case.dart' as _i19;
import 'domain/service/usecases/delete_service_use_case.dart' as _i21;
import 'domain/service/usecases/provider_list_use_case.dart' as _i28;
import 'domain/service/usecases/service_list_use_case.dart' as _i31;
import 'domain/service/usecases/update_user_use_case.dart' as _i13;
import 'injectable_module.dart' as _i49;
import 'presentation/auth/blocs/check_reset_password_code_bloc/check_reset_password_code_bloc.dart'
    as _i40;
import 'presentation/auth/blocs/get_mine_bloc/get_mine_bloc.dart' as _i41;
import 'presentation/auth/blocs/login/login_bloc.dart' as _i42;
import 'presentation/auth/blocs/request_reset_password_bloc/request_reset_password_bloc.dart'
    as _i44;
import 'presentation/auth/blocs/reset_password_bloc/reset_password_bloc.dart'
    as _i45;
import 'presentation/auth/blocs/sign_up_bloc/sign_up_bloc.dart' as _i47;
import 'presentation/auth/blocs/update_profile_up_bloc/update_profile_bloc.dart'
    as _i48;
import 'presentation/core/auth/auth_bloc.dart' as _i38;
import 'presentation/service/blocs/add_service_bloc/add_service_bloc.dart'
    as _i37;
import 'presentation/service/blocs/category_list_bloc/category_list_bloc.dart'
    as _i39;
import 'presentation/service/blocs/delete_service_bloc/delete_service_bloc.dart'
    as _i22;
import 'presentation/service/blocs/provider_list_bloc/provider_list_bloc.dart'
    as _i43;
import 'presentation/service/blocs/service_list_bloc/service_list_bloc.dart'
    as _i46;
import 'presentation/service/blocs/update_service_bloc/update_service_bloc.dart'
    as _i36;

const String _prod = 'prod';
const String _dev = 'dev';
const String _staging = 'staging';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Configuration>(() => _i3.ProductionConfiguration(),
      registerFor: {_prod});
  gh.lazySingleton<_i3.Configuration>(() => _i3.DevConfiguration(),
      registerFor: {_dev});
  gh.lazySingleton<_i3.Configuration>(() => _i3.StagingConfiguration(),
      registerFor: {_staging});
  gh.lazySingleton<_i4.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i5.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.lazySingleton<_i6.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i8.NetworkInfoImpl(get<_i5.InternetConnectionChecker>()));
  gh.lazySingleton<_i9.ServiceRemoteDataSource>(() =>
      _i9.ServiceRemoteDataSourceImpl(
          get<_i4.Dio>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i10.ServiceRepository>(() => _i11.ServiceRepositoryImpl(
      get<_i9.ServiceRemoteDataSource>(),
      get<_i7.NetworkInfo>(),
      get<_i6.Logger>(),
      get<_i3.Configuration>()));
  await gh.lazySingletonAsync<_i12.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true);
  gh.lazySingleton<_i13.UpdateServiceUseCase>(() =>
      _i13.UpdateServiceUseCase(repository: get<_i10.ServiceRepository>()));
  gh.lazySingleton<_i14.AddServiceUseCase>(
      () => _i14.AddServiceUseCase(repository: get<_i10.ServiceRepository>()));
  gh.lazySingleton<_i15.AuthLocalDatasource>(
      () => _i15.AuthLocalDatasourceImpl(get<_i12.SharedPreferences>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i16.AuthRemoteDataSource>(() =>
      _i16.AuthRemoteDataSourceImpl(get<_i4.Dio>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i17.AuthRepository>(() => _i18.AuthRepositoryImpl(
      get<_i15.AuthLocalDatasource>(),
      get<_i16.AuthRemoteDataSource>(),
      get<_i7.NetworkInfo>(),
      get<_i6.Logger>(),
      get<_i3.Configuration>()));
  gh.lazySingleton<_i19.CategoryListUseCase>(() =>
      _i19.CategoryListUseCase(repository: get<_i10.ServiceRepository>()));
  gh.lazySingleton<_i20.CheckResetPasswordCodeUseCase>(() =>
      _i20.CheckResetPasswordCodeUseCase(
          repository: get<_i17.AuthRepository>()));
  gh.lazySingleton<_i21.DeleteServiceUseCase>(() =>
      _i21.DeleteServiceUseCase(repository: get<_i10.ServiceRepository>()));
  gh.lazySingleton<_i22.DeleteUserBloc>(
      () => _i22.DeleteUserBloc(get<_i21.DeleteServiceUseCase>()));
  gh.lazySingleton<_i23.GetFirstTimeLoggedUseCase>(
      () => _i23.GetFirstTimeLoggedUseCase(get<_i17.AuthRepository>()));
  gh.lazySingleton<_i24.GetMineUseCase>(
      () => _i24.GetMineUseCase(get<_i17.AuthRepository>()));
  gh.lazySingleton<_i25.GetSignedInUserUseCase>(
      () => _i25.GetSignedInUserUseCase(get<_i17.AuthRepository>()));
  gh.lazySingleton<_i26.LoginUseCase>(
      () => _i26.LoginUseCase(get<_i17.AuthRepository>()));
  gh.lazySingleton<_i27.LogoutUseCase>(
      () => _i27.LogoutUseCase(repository: get<_i17.AuthRepository>()));
  gh.lazySingleton<_i28.ProviderListUseCase>(() =>
      _i28.ProviderListUseCase(repository: get<_i10.ServiceRepository>()));
  gh.lazySingleton<_i29.RequestResetPasswordUseCase>(() =>
      _i29.RequestResetPasswordUseCase(repository: get<_i17.AuthRepository>()));
  gh.lazySingleton<_i30.ResetPasswordUseCase>(
      () => _i30.ResetPasswordUseCase(repository: get<_i17.AuthRepository>()));
  gh.lazySingleton<_i31.ServiceListUseCase>(
      () => _i31.ServiceListUseCase(repository: get<_i10.ServiceRepository>()));
  gh.lazySingleton<_i32.SetFirstTimeLoggedUseCase>(
      () => _i32.SetFirstTimeLoggedUseCase(get<_i17.AuthRepository>()));
  gh.lazySingleton<_i33.SignUpUseCase>(
      () => _i33.SignUpUseCase(repository: get<_i17.AuthRepository>()));
  gh.lazySingleton<_i34.SubscribeToAuthStatusUseCase>(
      () => _i34.SubscribeToAuthStatusUseCase(get<_i17.AuthRepository>()));
  gh.lazySingleton<_i35.UpdateProfileUseCase>(
      () => _i35.UpdateProfileUseCase(repository: get<_i17.AuthRepository>()));
  gh.lazySingleton<_i36.UpdateServiceBloc>(
      () => _i36.UpdateServiceBloc(get<_i13.UpdateServiceUseCase>()));
  gh.lazySingleton<_i37.AddServiceBloc>(
      () => _i37.AddServiceBloc(get<_i14.AddServiceUseCase>()));
  gh.factory<_i38.AuthBloc>(() => _i38.AuthBloc(
      get<_i25.GetSignedInUserUseCase>(),
      get<_i24.GetMineUseCase>(),
      get<_i27.LogoutUseCase>(),
      get<_i34.SubscribeToAuthStatusUseCase>(),
      get<_i23.GetFirstTimeLoggedUseCase>(),
      get<_i32.SetFirstTimeLoggedUseCase>()));
  gh.factory<_i39.CategoryListBloc>(
      () => _i39.CategoryListBloc(get<_i19.CategoryListUseCase>()));
  gh.factory<_i40.CheckResetPasswordCodeBloc>(() =>
      _i40.CheckResetPasswordCodeBloc(
          get<_i20.CheckResetPasswordCodeUseCase>()));
  gh.factory<_i41.GetMineBloc>(
      () => _i41.GetMineBloc(get<_i24.GetMineUseCase>()));
  gh.factory<_i42.LoginBloc>(
      () => _i42.LoginBloc(login: get<_i26.LoginUseCase>()));
  gh.factory<_i43.ProviderListBloc>(
      () => _i43.ProviderListBloc(get<_i28.ProviderListUseCase>()));
  gh.factory<_i44.RequestResetPasswordBloc>(() =>
      _i44.RequestResetPasswordBloc(get<_i29.RequestResetPasswordUseCase>()));
  gh.factory<_i45.ResetPasswordBloc>(
      () => _i45.ResetPasswordBloc(get<_i30.ResetPasswordUseCase>()));
  gh.factory<_i46.ServiceListBloc>(
      () => _i46.ServiceListBloc(get<_i31.ServiceListUseCase>()));
  gh.factory<_i47.SignUpBloc>(() => _i47.SignUpBloc(get<_i33.SignUpUseCase>()));
  gh.factory<_i48.UpdateProfileBloc>(
      () => _i48.UpdateProfileBloc(get<_i35.UpdateProfileUseCase>()));
  return get;
}

class _$InjectableModule extends _i49.InjectableModule {}
