import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

enum Environment {
  dev,
  stg,
  prod,
  local,
  pocketbaseUrl,
  emailPocketbase,
  passwordPocketbase,
  bucketId,
  keyId,
  applicationKey,
  apiUrlB2,
  baseUrlImage,
  competitionUrlApi,
  giphyApiKey,
  openAiApiKey,
  perspectiveApiKey,
}

class EnvironmentConfig {
  static Environment _environment = Environment.stg;
  static Map<String, dynamic> _config = {};

  static Environment get environment => _environment;
  static Map<String, dynamic> get config => _config;

  static Future<void> initialize(Environment env) async {
    _environment = env;

    try {
      // Carrega o arquivo de configuração baseado no ambiente
      final configFile = await rootBundle.loadString(
        'env/.env.${_environment.name}.json',
      );

      _config = json.decode(configFile) as Map<String, dynamic>;

      log('Ambiente carregado: ${_environment.name}');
      log('Configurações: $_config');
    } catch (e) {
      log('Erro ao carregar configurações: $e');
      _config = {
        'API_URL': 'http://api.futshow.app.br/v1',
        'API_IP': 'http://207.180.207.176:3001/v1',
        'API_LOCAL': 'http://localhost:3001/v1',
      };
      rethrow;
      // Fallback para configurações padrão
    }
  }

  static String get apiUrl => _config['API_URL']?.toString() ?? '';
  static String get apiIP => _config['API_IP']?.toString() ?? '';
  static String get apiLocal => _config['API_LOCAL']?.toString() ?? '';

  static String get pocketbaseUrl =>
      _config['URL_POCKETBASE']?.toString() ?? '';
  static String get emailPocketbase =>
      _config['EMAIL_POCKETBASE']?.toString() ?? '';
  static String get passwordPocketbase =>
      _config['PASSWORD_POCKETBASE']?.toString() ?? '';
  static String get bucketId => _config['BUCKET_ID']?.toString() ?? '';
  static String get keyId => _config['KEY_ID']?.toString() ?? '';
  static String get applicationKey =>
      _config['APPLICATION_KEY']?.toString() ?? '';
  static String get apiUrlB2 => _config['BUCKET_URL']?.toString() ?? '';
  static String get baseUrlImage => _config['BASE_URL_IMAGE']?.toString() ?? '';
  static String get competitionUrlApi =>
      _config['COMPETITION_URL_API']?.toString() ?? '';

  static String get giphyApiKey => _config['GIPHY_KEY']?.toString() ?? '';
  static String get openAiApiKey => _config['OPENAI_KEY']?.toString() ?? '';
  static String get perspectiveApiKey =>
      _config['GOOGLE_PERSPECTIVE_KEY']?.toString() ?? '';
}
