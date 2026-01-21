import '../../domain/domain.dart';

import '../models/user_model.dart';
import '../services/local_storage/local_storage.dart';
import '../services/user_service.dart';

class UserRepository implements IUserRepository {
  UserRepository({
    required this.service,
    required this.localStorageService,
  });

  final UserService service;
  final UserLocalStorageService localStorageService;

  @override
  Future<UserEntity> getRandonUser() async {
    final result = await service.getRandonUser();
    await localStorageService.create(result);
    return result.toEntity();
  }

  @override
  Future<UserEntity> getUser(String id) async {
    final localUser = await localStorageService.getById(id);
    if (localUser != null) {
      return localUser.toEntity();
    }

    final result = await service.getUser(id);
    await localStorageService.create(result);
    return result.toEntity();
  }

  @override
  Future<List<UserEntity>> getAllUsers() async {
    final localUsers = await localStorageService.getAll();
    if (localUsers.isNotEmpty) {
      return localUsers.map((UserModel u) => u.toEntity()).toList();
    }

    final result = await service.getAllUsers();
    for (final user in result) {
      await localStorageService.create(user);
    }
    return result.map((m) => m.toEntity()).toList();
  }

  @override
  Future<UserEntity> createUser(UserEntity user) async {
    final userModel = UserModel.fromEntity(user);
    await localStorageService.create(userModel);
    return user;
  }

  @override
  Future<UserEntity> updateUser(UserEntity user) async {
    final userModel = UserModel.fromEntity(user);
    await localStorageService.update(userModel);
    return user;
  }

  @override
  Future<void> deleteUser(String id) async {
    await localStorageService.delete(id);
  }

  @override
  Future<List<UserEntity>> getLocalUsers() async {
    final localUsers = await localStorageService.getAll();
    return localUsers.map((UserModel u) => u.toEntity()).toList();
  }
}
