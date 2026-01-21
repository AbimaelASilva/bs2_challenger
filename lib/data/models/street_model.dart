import '../../domain/entities/street_entity.dart';

class StreetModel extends StreetEntity {
  const StreetModel({
    required super.number,
    required super.name,
  });

  factory StreetModel.fromJson(Map<String, dynamic> json) {
    return StreetModel(
      number: json['number'] as int? ?? 0,
      name: json['name']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
    };
  }

  factory StreetModel.fromEntity(StreetEntity entity) {
    return StreetModel(
      number: entity.number,
      name: entity.name,
    );
  }

  StreetEntity toEntity() {
    return StreetEntity(
      number: number,
      name: name,
    );
  }
}
