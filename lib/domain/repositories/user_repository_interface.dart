import '../entities/user_entity.dart';

abstract class IUserRepository {
  Future<UserEntity> getUser(String id);

  Future<UserEntity> getRandonUser();

  Future<List<UserEntity>> getAllUsers();

  Future<UserEntity> createUser(UserEntity user);

  Future<UserEntity> updateUser(UserEntity user);

  Future<void> deleteUser(String id);

  Future<List<UserEntity>> getLocalUsers();
}
