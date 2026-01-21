import '../../domain/entities/picture_entity.dart';

class PictureModel extends PictureEntity {
  const PictureModel({
    required super.large,
    required super.medium,
    required super.thumbnail,
  });

  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(
      large: json['large']?.toString() ?? '',
      medium: json['medium']?.toString() ?? '',
      thumbnail: json['thumbnail']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'large': large,
      'medium': medium,
      'thumbnail': thumbnail,
    };
  }

  factory PictureModel.fromEntity(PictureEntity entity) {
    return PictureModel(
      large: entity.large,
      medium: entity.medium,
      thumbnail: entity.thumbnail,
    );
  }

  PictureEntity toEntity() {
    return PictureEntity(
      large: large,
      medium: medium,
      thumbnail: thumbnail,
    );
  }
}
