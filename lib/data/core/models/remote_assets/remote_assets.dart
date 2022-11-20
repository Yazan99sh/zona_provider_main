import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/data/core/utils/configuration.dart';

@LazySingleton()
class RemoteAssets {
  final Configuration configuration;

  RemoteAssets(this.configuration);

  String get url => configuration.getBaseUrl;
}
