class StreetEntity {
  final int number;
  final String name;

  const StreetEntity({
    required this.number,
    required this.name,
  });

  StreetEntity.empty()
      : number = 0,
        name = '';

  StreetEntity copyWith({
    int? number,
    String? name,
  }) {
    return StreetEntity(
      number: number ?? this.number,
      name: name ?? this.name,
    );
  }
}
