import '../../domain/entities/info_entity.dart';

class InfoModel extends InfoEntity {
  const InfoModel({
    required super.seed,
    required super.results,
    required super.page,
    required super.version,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      seed: json['seed']?.toString() ?? '',
      results: json['results'] as int? ?? 0,
      page: json['page'] as int? ?? 0,
      version: json['version']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'seed': seed,
      'results': results,
      'page': page,
      'version': version,
    };
  }

  factory InfoModel.fromEntity(InfoEntity entity) {
    return InfoModel(
      seed: entity.seed,
      results: entity.results,
      page: entity.page,
      version: entity.version,
    );
  }

  InfoEntity toEntity() {
    return InfoEntity(
      seed: seed,
      results: results,
      page: page,
      version: version,
    );
  }
}
