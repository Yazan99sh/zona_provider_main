import 'package:zona_provider_main/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async {
  $initGetIt(getIt, environment: env);
}

Future<void> resetInjection() async {
  await getIt.reset();
}
