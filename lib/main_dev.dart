


import 'flavor_config.dart';
import 'main.dart';

void main() {
  final config = AppConfig.fromFlavor(Flavor.dev);
  mainCommon(config);
}