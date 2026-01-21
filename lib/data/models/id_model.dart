import '../../domain/entities/id_entity.dart';

class IdModel extends IdEntity {
  const IdModel({
    required super.name,
    required super.value,
  });

  factory IdModel.fromJson(Map<String, dynamic> json) {
    return IdModel(
      name: json['name']?.toString() ?? '',
      value: json['value']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
    };
  }

  factory IdModel.fromEntity(IdEntity entity) {
    return IdModel(
      name: entity.name,
      value: entity.value,
    );
  }

  IdEntity toEntity() {
    return IdEntity(
      name: name,
      value: value,
    );
  }
}
