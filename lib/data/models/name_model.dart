import '../../domain/entities/name_entity.dart';

class NameModel extends NameEntity {
  const NameModel({
    required super.title,
    required super.first,
    required super.last,
  });

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(
      title: json['title']?.toString() ?? '',
      first: json['first']?.toString() ?? '',
      last: json['last']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'first': first,
      'last': last,
    };
  }

  factory NameModel.fromEntity(NameEntity entity) {
    return NameModel(
      title: entity.title,
      first: entity.first,
      last: entity.last,
    );
  }

  NameEntity toEntity() {
    return NameEntity(
      title: title,
      first: first,
      last: last,
    );
  }
}
