class UserEntity {
  final String id;
  final String name;
  final String email;
  final String location;
  final String avatarUrl;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.location,
    required this.avatarUrl,
  });

  UserEntity.empty()
      : id = '',
        name = '',
        email = '',
        location = '',
        avatarUrl = '';

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? location,
    String? avatarUrl,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      location: location ?? this.location,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
