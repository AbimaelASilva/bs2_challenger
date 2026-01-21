class RegisteredEntity {
  final DateTime date;
  final int age;

  const RegisteredEntity({
    required this.date,
    required this.age,
  });

  RegisteredEntity.empty()
      : date = DateTime(1970),
        age = 0;

  RegisteredEntity copyWith({
    DateTime? date,
    int? age,
  }) {
    return RegisteredEntity(
      date: date ?? this.date,
      age: age ?? this.age,
    );
  }
}
