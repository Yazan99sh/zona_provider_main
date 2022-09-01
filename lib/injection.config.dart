// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;
import 'package:logger/logger.dart' as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'data/auth/datasources/local/auth_local_datasource.dart' as _i3;
import 'data/auth/repositories/auth_repository_impl.dart' as _i10;
import 'data/core/utils/configuration.dart' as _i5;
import 'data/core/utils/network/network_info.dart' as _i7;
import 'domain/auth/repositories/auth_repository.dart' as _i9;
import 'domain/auth/usecases/get_first_time_logged_use_case.dart' as _i12;
import 'domain/auth/usecases/set_first_time_logged_use_case.dart' as _i13;
import 'domain/core/utils/network/network_info.dart' as _i6;

const String _dev = 'dev';
const String _staging = 'staging';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AuthLocalDatasource>(
      () => _i3.AuthLocalDatasourceImpl(get<_i4.SharedPreferences>()));
  gh.lazySingleton<_i5.Configuration>(() => _i5.DevConfiguration(),
      registerFor: {_dev});
  gh.lazySingleton<_i5.Configuration>(() => _i5.StagingConfiguration(),
      registerFor: {_staging});
  gh.lazySingleton<_i5.Configuration>(() => _i5.ProductionConfiguration(),
      registerFor: {_prod});
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i7.NetworkInfoImpl(get<_i8.InternetConnectionChecker>()));
  gh.lazySingleton<_i9.AuthRepository>(() => _i10.AuthRepositoryImpl(
      get<_i3.AuthLocalDatasource>(),
      get<_i6.NetworkInfo>(),
      get<_i11.Logger>(),
      get<_i5.Configuration>()));
  gh.lazySingleton<_i12.GetFirstTimeLoggedUseCase>(
      () => _i12.GetFirstTimeLoggedUseCase(get<_i9.AuthRepository>()));
  gh.lazySingleton<_i13.SetFirstTimeLoggedUseCase>(
      () => _i13.SetFirstTimeLoggedUseCase(get<_i9.AuthRepository>()));
  return get;
}
