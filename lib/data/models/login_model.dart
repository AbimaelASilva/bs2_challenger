import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.uuid,
    required super.username,
    required super.password,
    required super.salt,
    required super.md5,
    required super.sha1,
    required super.sha256,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      uuid: json['uuid']?.toString() ?? '',
      username: json['username']?.toString() ?? '',
      password: json['password']?.toString() ?? '',
      salt: json['salt']?.toString() ?? '',
      md5: json['md5']?.toString() ?? '',
      sha1: json['sha1']?.toString() ?? '',
      sha256: json['sha256']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'username': username,
      'password': password,
      'salt': salt,
      'md5': md5,
      'sha1': sha1,
      'sha256': sha256,
    };
  }

  factory LoginModel.fromEntity(LoginEntity entity) {
    return LoginModel(
      uuid: entity.uuid,
      username: entity.username,
      password: entity.password,
      salt: entity.salt,
      md5: entity.md5,
      sha1: entity.sha1,
      sha256: entity.sha256,
    );
  }

  LoginEntity toEntity() {
    return LoginEntity(
      uuid: uuid,
      username: username,
      password: password,
      salt: salt,
      md5: md5,
      sha1: sha1,
      sha256: sha256,
    );
  }
}
