import '../../domain/entities/timezone_entity.dart';

class TimezoneModel extends TimezoneEntity {
  const TimezoneModel({
    required super.offset,
    required super.description,
  });

  factory TimezoneModel.fromJson(Map<String, dynamic> json) {
    return TimezoneModel(
      offset: json['offset']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'offset': offset,
      'description': description,
    };
  }

  factory TimezoneModel.fromEntity(TimezoneEntity entity) {
    return TimezoneModel(
      offset: entity.offset,
      description: entity.description,
    );
  }

  TimezoneEntity toEntity() {
    return TimezoneEntity(
      offset: offset,
      description: description,
    );
  }
}
