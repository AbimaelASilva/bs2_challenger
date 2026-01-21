import 'environment.dart';

class Env {
  static String get apiUrl => EnvironmentConfig.apiUrl;
  static String get apiIP => EnvironmentConfig.apiIP;
  static String get apiLocal => EnvironmentConfig.apiLocal;
  static String get pocketbaseUrl => EnvironmentConfig.pocketbaseUrl;
  static String get emailPocketbase => EnvironmentConfig.emailPocketbase;
  static String get passwordPocketbase => EnvironmentConfig.passwordPocketbase;
}
