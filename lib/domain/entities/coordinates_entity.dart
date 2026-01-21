class CoordinatesEntity {
  final String latitude;
  final String longitude;

  const CoordinatesEntity({
    required this.latitude,
    required this.longitude,
  });

  CoordinatesEntity.empty()
      : latitude = '',
        longitude = '';

  CoordinatesEntity copyWith({
    String? latitude,
    String? longitude,
  }) {
    return CoordinatesEntity(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
