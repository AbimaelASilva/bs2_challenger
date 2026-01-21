class IdEntity {
  final String name;
  final String value;

  const IdEntity({
    required this.name,
    required this.value,
  });

  IdEntity.empty()
      : name = '',
        value = '';

  IdEntity copyWith({
    String? name,
    String? value,
  }) {
    return IdEntity(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }
}
