class DobEntity {
  final DateTime date;
  final int age;

  const DobEntity({
    required this.date,
    required this.age,
  });

  DobEntity.empty()
      : date = DateTime(1970),
        age = 0;

  DobEntity copyWith({
    DateTime? date,
    int? age,
  }) {
    return DobEntity(
      date: date ?? this.date,
      age: age ?? this.age,
    );
  }
}
