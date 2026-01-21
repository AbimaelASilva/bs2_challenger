import '../../domain/entities/dob_entity.dart';

class DobModel extends DobEntity {
  const DobModel({
    required super.date,
    required super.age,
  });

  factory DobModel.fromJson(Map<String, dynamic> json) {
    final dateString = json['date']?.toString();
    DateTime date = DateTime(1970);
    if (dateString != null) {
      date = DateTime.tryParse(dateString) ?? DateTime(1970);
    }

    return DobModel(
      date: date,
      age: json['age'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'age': age,
    };
  }

  factory DobModel.fromEntity(DobEntity entity) {
    return DobModel(
      date: entity.date,
      age: entity.age,
    );
  }

  DobEntity toEntity() {
    return DobEntity(
      date: date,
      age: age,
    );
  }
}
