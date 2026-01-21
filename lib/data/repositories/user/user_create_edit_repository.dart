import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';
import '../../../domain/models/user/user.dart';
import '../../services/services.dart';

class UserRepository {
  UserRepository({required this.service});

  UserService service;

  AsyncResult<UserModel> saveUser(UserModel user) async {
    if (user.id.isEmpty) {
      return registerUser(user);
    } else {
      return updateUser(user);
    }
  }

  AsyncResult<UserModel> registerUser(UserModel user) async =>
      service.registerUser(user);

  AsyncResult<UserModel> updateUser(UserModel user) async =>
      service.updateUser(user);
}
