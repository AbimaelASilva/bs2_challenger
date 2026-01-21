class NameEntity {
  final String title;
  final String first;
  final String last;

  const NameEntity({
    required this.title,
    required this.first,
    required this.last,
  });

  NameEntity.empty()
      : title = '',
        first = '',
        last = '';

  NameEntity copyWith({
    String? title,
    String? first,
    String? last,
  }) {
    return NameEntity(
      title: title ?? this.title,
      first: first ?? this.first,
      last: last ?? this.last,
    );
  }
}
