// ignore_for_file: inference_failure_on_collection_literal

import 'dart:developer';

import 'package:result_dart/result_dart.dart';
import '../../../core/config/environment.dart';
import '../../../core/core.dart';
import '../../../core/http/http.dart';

class GenericService {
  GenericService({
    required this.client,
  });

  final RestClient client;

  AsyncResult<Map<String, dynamic>> isContentToxic(String text) async {
    try {
      final url =
          '${AppUrls.discoveryServiceUrl}?key=${EnvironmentConfig.perspectiveApiKey}';
      final response = await client.auth().post<Map<String, dynamic>>(
        url,
        data: {
          'comment': {'text': text},
          'requestedAttributes': {
            // 'SEXUALLY_EXPLICIT': {},
            'TOXICITY': {},
            'SEVERE_TOXICITY': {},
            'IDENTITY_ATTACK': {},
            'INSULT': {},
            'PROFANITY': {},
            'THREAT': {},
          },
        },
      );
      log('Resposta do serviço de toxicidade: ${response.data?['attributeScores']}');

      if (response.statusCode == 200) {
        final data = response.data;
        final scores = (data?['attributeScores'] ?? {}) as Map<String, dynamic>;

        return Success(scores);
      }

      return const Success(<String, dynamic>{});
    } catch (e) {
      'Erro ao verificar toxicidade: $e';
      rethrow;
    }
  }

  AsyncResult<void> requestResetPassword(String phone) {
    return handleRequest(() async {
      //   final pb = PocketBase('http://localhost:8090');
      //   pb.admins.authWithPassword(
      //     EnvironmentConfig.emailPocketbase,
      //     EnvironmentConfig.passwordPocketbase,
      //   );

      await client.post('/request-password-reset', data: {
        'email': '$phone@base-code.com',
      },);

      log('DEPOIS DO resetPassword');

      return Success;
    });
  }
}
