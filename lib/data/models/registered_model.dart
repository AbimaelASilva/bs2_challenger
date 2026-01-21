import '../../domain/entities/registered_entity.dart';

class RegisteredModel extends RegisteredEntity {
  const RegisteredModel({
    required super.date,
    required super.age,
  });

  factory RegisteredModel.fromJson(Map<String, dynamic> json) {
    final dateString = json['date']?.toString();
    DateTime date = DateTime(1970);
    if (dateString != null) {
      date = DateTime.tryParse(dateString) ?? DateTime(1970);
    }

    return RegisteredModel(
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

  factory RegisteredModel.fromEntity(RegisteredEntity entity) {
    return RegisteredModel(
      date: entity.date,
      age: entity.age,
    );
  }

  RegisteredEntity toEntity() {
    return RegisteredEntity(
      date: date,
      age: age,
    );
  }
}
