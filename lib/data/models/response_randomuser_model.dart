import '../../domain/domain.dart';
import 'info_model.dart';
import 'user_model.dart';

class ResponseRandomUserModel {
  final List<UserModel> results;
  final InfoModel info;

  const ResponseRandomUserModel({
    required this.results,
    required this.info,
  });

  factory ResponseRandomUserModel.fromJson(Map<String, dynamic> json) {
    final resultsJson = json['results'] as List<dynamic>? ?? [];
    final infoJson = json['info'] as Map<String, dynamic>? ?? {};

    return ResponseRandomUserModel(
      results: resultsJson
          .map(
            (userJson) =>
                UserModel.fromJson(userJson as Map<String, dynamic>),
          )
          .toList(),
      info: InfoModel.fromJson(infoJson),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results.map((user) => user.toJson()).toList(),
      'info': info.toJson(),
    };
  }

  factory ResponseRandomUserModel.fromEntity(ResponseRandomUserEntity entity) {
    return ResponseRandomUserModel(
      results: entity.results.map(UserModel.fromEntity).toList(),
      info: InfoModel.fromEntity(entity.info),
    );
  }

  ResponseRandomUserEntity toEntity() {
    return ResponseRandomUserEntity(
      results: results.map((user) => user.toEntity()).toList(),
      info: info.toEntity(),
    );
  }
}
