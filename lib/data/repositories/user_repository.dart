import '../../domain/domain.dart';

import '../services/user_service.dart';

class UserRepository implements IUserRepository {
  UserRepository({required this.service});

  final UserService service;

  @override
  Future<UserEntity> getUser(String id) async {
    final result = await service.getUser(id);

    return result.toEntity();
  }

  @override
  Future<List<UserEntity>> getAllUsers() async {
    final result = await service.getAllUsers();

    return result.map((m) => m.toEntity()).toList();
  }
}
