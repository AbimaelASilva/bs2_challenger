// ignore_for_file: avoid_catches_without_on_clauses, document_ignores

import 'dart:developer';

import 'package:result_dart/result_dart.dart';

import '../../../core/http/http.dart';
import '../../../domain/models/models.dart';

class AuthService {
  AuthService({
    required this.client,
    //required this.pocketBase,
  });

  final RestClient client;
  //final PocketBase pocketBase;

  AsyncResult<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) {
    return handleRequest(() async {
      final auth = await client.post('/auth-with-password', data: {
        'email': username,
        'password': password,
      },);

      log("AUTH: $auth");
      return {};
    });
  }

  AsyncResult<UserModel> getMe({required String id}) {
    return handleRequest(() async {
      // final response = await client.get<Map<String, dynamic>>('/user/me');
      final record = await client.get('/users/id');

      log("RECORD: $record");

      return UserModel.fromMap(const {});
    });
  }

  AsyncResult<bool> deleteAccount({required String id}) {
    return handleRequest(() async {
      await client.post('/users/id');

      return true;
    });
  }
}
