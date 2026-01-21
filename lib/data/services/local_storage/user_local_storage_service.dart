import '../../models/user_model.dart';
import 'local_storage_service.dart';

class UserLocalStorageService extends LocalStorageService<UserModel> {
  UserLocalStorageService({required super.storage}) : super(key: 'users');

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(UserModel item) {
    return item.toJson();
  }

  @override
  String getId(UserModel item) {
    return item.login.uuid;
  }
}
