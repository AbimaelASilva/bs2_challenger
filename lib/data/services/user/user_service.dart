// ignore_for_file: avoid_catches_without_on_clauses, document_ignores

import 'dart:developer';

import 'package:result_dart/result_dart.dart';

import '../../../core/http/http.dart';
import '../../../domain/models/user/user.dart';

class UserService {
  UserService({
    required this.client,
    // required this.pocketBase,
  });

  final GenericClientAdapter client;
  // final PocketBase pocketBase;

  AsyncResult<UserModel> registerUser(UserModel user) {
    return handleRequest(() async {
      final record = await client.post('caminho');

      log("USUÁRIO CRIADO NO POCKETBASE: ${record.data}");

      //  final map = response.data!['data'] as Map<String, dynamic>;
      //  log("USUÁRIO CRIADO NO POCKETBASE: ${record.data}");
      return UserModel.fromMap(const {});
    });
  }

  AsyncResult<UserModel> updateUser(UserModel user) {
    return handleRequest(() async {
      // final response = await client.put<Map<String, dynamic>>(
      //   '/user/${user.id}',
      //   data: user.toSave(),
      // );

      // final map = response.data!['data'] as Map<String, dynamic>;
      final record = await client.put('caminho');

      return UserModel.fromMap(const {});
    });
  }
}
