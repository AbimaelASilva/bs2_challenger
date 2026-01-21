import '../../domain/entities/coordinates_entity.dart';

class CoordinatesModel extends CoordinatesEntity {
  const CoordinatesModel({
    required super.latitude,
    required super.longitude,
  });

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      latitude: json['latitude']?.toString() ?? '',
      longitude: json['longitude']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory CoordinatesModel.fromEntity(CoordinatesEntity entity) {
    return CoordinatesModel(
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }

  CoordinatesEntity toEntity() {
    return CoordinatesEntity(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
