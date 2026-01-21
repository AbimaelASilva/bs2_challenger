class PictureEntity {
  final String large;
  final String medium;
  final String thumbnail;

  const PictureEntity({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  PictureEntity.empty()
      : large = '',
        medium = '',
        thumbnail = '';

  PictureEntity copyWith({
    String? large,
    String? medium,
    String? thumbnail,
  }) {
    return PictureEntity(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
