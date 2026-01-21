import 'dart:developer';

import 'package:result_dart/result_dart.dart';

import '../../../core/core.dart';
import '../../../domain/models/user/user_model.dart';
import '../../services/services.dart';

class AuthRepository {
  AuthRepository({
    required this.service,
    required this.storageService,
  });

  final AuthService service;
  final StorageService storageService;

  AsyncResult<UserModel> login({
    required String username,
    required String password,
  }) async {
    final auth = await service.login(username: username, password: password);

    return auth.fold(
      (success) async => Success(UserModel.fromMap(const {})),
      Failure.new,
    );
  }

  AsyncResult<UserModel> saveLocalUser({
    required UserModel user,
  }) async {
    try {
      await storageService.saveMap(CacheKey.credentials, {
        "user": user.toMap(),
      });

      return Success(user);
    } catch (e) {
      return throw Exception(e);
    }
  }

  AsyncResult<UserModel> getMe({required String id}) async {
    final response = await service.getMe(id: id);

    return response.fold(
      (success) async {
        await storageService.saveMap(CacheKey.credentials, success.toMap());
        return Success(success);
      },
      (failure) {
        return Failure(failure);
      },
    );
  }

  AsyncResult<UserModel> get getMeLocal async {
    final response = storageService.fetchMap(CacheKey.credentials);

    return response.fold(
      (success) async {
        log("USUÁRIO RECUPERADO LOCALMENTE: $success");
        return Success(
          UserModel.fromMap(success['user'] as Map<String, dynamic>),
        );
      },
      (failure) {
        return Failure(failure);
      },
    );
  }

  Future<void> logout() async {
    // await storageService.clearKey(CacheKey.token);
    // await storageService.clearKey(CacheKey.credentials);
    // await storageService.clearKey(CacheKey.user);
    await storageService.clearAll();
  }

  AsyncResult<bool> deleteAccount({required String id}) async {
    final auth = await service.deleteAccount(id: id);

    return auth.fold(
      (success) async {
        await logout();
        return const Success(true);
      },
      Failure.new,
    );
  }
}
