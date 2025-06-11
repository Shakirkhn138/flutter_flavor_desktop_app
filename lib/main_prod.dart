


import 'flavor_config.dart';
import 'main.dart';

void main() {
  final config = AppConfig.fromFlavor(Flavor.prod);
  mainCommon(config);
}