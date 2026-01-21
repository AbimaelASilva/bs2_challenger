import 'info_entity.dart';
import 'user_entity.dart';

class ResponseRandomUserEntity {
  final List<UserEntity> results;
  final InfoEntity info;

  const ResponseRandomUserEntity({
    required this.results,
    required this.info,
  });

  ResponseRandomUserEntity.empty()
      : results = const [],
        info = InfoEntity.empty();

  ResponseRandomUserEntity copyWith({
    List<UserEntity>? results,
    InfoEntity? info,
  }) {
    return ResponseRandomUserEntity(
      results: results ?? this.results,
      info: info ?? this.info,
    );
  }
}
