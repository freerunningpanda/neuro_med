import 'package:upmind_front_client/core/utils/constants/api_keys.dart';

enum Environment { development, production }

// ignore: avoid_classes_with_only_static_members
abstract class AppEnvironment {
  static late String baseUrl;
  static late Environment _environment;
  static Environment get environment => _environment;
  static void setupEnv(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.development:
        {
          baseUrl = ApiKeys.httpHostDev;
          break;
        }
      case Environment.production:
        {
          baseUrl = ApiKeys.httpHost;
          break;
        }
    }
  }

  static String getEnvironmentString(Environment env) => switch (env) {
        Environment.development => 'dev',
        Environment.production => 'prod',
      };
}
