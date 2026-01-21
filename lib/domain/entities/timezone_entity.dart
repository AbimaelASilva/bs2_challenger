class TimezoneEntity {
  final String offset;
  final String description;

  const TimezoneEntity({
    required this.offset,
    required this.description,
  });

  TimezoneEntity.empty()
      : offset = '',
        description = '';

  TimezoneEntity copyWith({
    String? offset,
    String? description,
  }) {
    return TimezoneEntity(
      offset: offset ?? this.offset,
      description: description ?? this.description,
    );
  }
}
