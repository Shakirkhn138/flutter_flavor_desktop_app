
enum Flavor { dev, prod }

class AppConfig {
  final String appName;
  final String flavor;
  final String apiBaseUrl;

  AppConfig._({
    required this.appName,
    required this.flavor,
    required this.apiBaseUrl,
  });

  factory AppConfig.fromFlavor(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        return AppConfig._(
          appName: 'My Windows App (Dev)',
          flavor: 'dev',
          apiBaseUrl: 'https://dev.api.example.com',
        );
      default:
        return AppConfig._(
          appName: 'My Windows App',
          flavor: 'prod',
          apiBaseUrl: 'https://api.example.com',
        );
    }
  }
}
