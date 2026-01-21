// ignore_for_file: avoid_catches_without_on_clauses, document_ignores

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:crypto/crypto.dart';

import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

import '../../../core/config/environment.dart';
import '../../../core/http/http.dart';

class UploadService {
  UploadService({
    required this.client,
  });

  final RestClient client;

  AsyncResult<void> upload({
    required File file,
    required String fileName,
  }) async {
    return handleRequest(() async {
      // 1. Autorizar
      try {
        final auth = await _b2AuthorizeAccount(
          keyId: EnvironmentConfig.keyId,
          applicationKey: EnvironmentConfig.applicationKey,
        );

        log(auth.toString());
        // 2. Obter URL de upload

        final authorizationToken =
            (auth['authorizationToken'] ?? '').toString();
        final uploadUrlResp = await _b2GetUploadUrl(
          apiUrl: EnvironmentConfig.apiUrlB2,
          authorizationToken: authorizationToken,
          bucketId: EnvironmentConfig.bucketId,
        );

        log(uploadUrlResp.toString());

        // 3. Fazer upload do arquivo
        final uploadUrl = (uploadUrlResp['uploadUrl'] ?? '').toString();
        final uploadAuthToken =
            (uploadUrlResp['authorizationToken'] ?? '').toString();
        await _b2UploadFile(
          uploadUrl: uploadUrl,
          uploadAuthToken: uploadAuthToken,
          file: file,
          fileName: fileName,
        );
        //A URL DE ACESSO É https://f005.backblazeb2.com/file/base-code-2/BABA_DA_PAZ_max9skrivtrwtjr_profileImageUrl.png
        return const Success('Arquivo enviado com sucesso');
      } catch (e) {
        rethrow;
      }
    });
  }

  Future<Map<String, dynamic>> _b2AuthorizeAccount({
    required String keyId,
    required String applicationKey,
  }) async {
    final credentials = base64Encode(utf8.encode('$keyId:$applicationKey'));

    final response = await http.get(
      Uri.parse('https://api.backblazeb2.com/b2api/v3/b2_authorize_account'),
      headers: {
        'Authorization': 'Basic $credentials',
      },
    );
    log(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to authorize B2 account');
    }
  }

  Future<Map<String, dynamic>> _b2GetUploadUrl({
    required String apiUrl,
    required String authorizationToken,
    required String bucketId,
  }) async {
    final response = await http.get(
      Uri.parse(
        'https://api005.backblazeb2.com/b2api/v2/b2_get_upload_url?bucketId=$bucketId',
      ),
      headers: {
        'Authorization': authorizationToken,
        'Content-Type': 'application/json',
      },
    );
    log(response.body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to get upload URL: ${response.body}');
    }
  }

  Future<void> _b2UploadFile({
    required String uploadUrl,
    required String uploadAuthToken,
    required File file,
    required String fileName,
  }) async {
    final fileBytes = await file.readAsBytes();
    final sha1Hash = sha1.convert(fileBytes).toString();

    final response = await http.post(
      Uri.parse(uploadUrl),
      headers: {
        'Authorization': uploadAuthToken,
        'X-Bz-File-Name': Uri.encodeComponent(fileName),
        'Content-Type': 'b2/x-auto',
        'Content-Length': fileBytes.length.toString(),
        'X-Bz-Content-Sha1': sha1Hash,
      },
      body: fileBytes,
    );

    log(response.body);

    if (response.statusCode == 200) {
      log('Upload successful: \\${response.body}');
    } else {
      throw Exception('Failed to upload file: \\${response.body}');
    }
  }
}
