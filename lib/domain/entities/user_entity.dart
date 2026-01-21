import 'dob_entity.dart';
import 'id_entity.dart';
import 'location_entity.dart';
import 'login_entity.dart';
import 'name_entity.dart';
import 'picture_entity.dart';
import 'registered_entity.dart';

class UserEntity {
  final String gender;
  final NameEntity name;
  final LocationEntity location;
  final String email;
  final LoginEntity login;
  final DobEntity dob;
  final RegisteredEntity registered;
  final String phone;
  final String cell;
  final IdEntity id;
  final PictureEntity picture;
  final String nat;

  const UserEntity({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  UserEntity.empty()
      : gender = '',
        name = NameEntity.empty(),
        location = LocationEntity.empty(),
        email = '',
        login = LoginEntity.empty(),
        dob = DobEntity.empty(),
        registered = RegisteredEntity.empty(),
        phone = '',
        cell = '',
        id = IdEntity.empty(),
        picture = PictureEntity.empty(),
        nat = '';

  UserEntity copyWith({
    String? gender,
    NameEntity? name,
    LocationEntity? location,
    String? email,
    LoginEntity? login,
    DobEntity? dob,
    RegisteredEntity? registered,
    String? phone,
    String? cell,
    IdEntity? id,
    PictureEntity? picture,
    String? nat,
  }) {
    return UserEntity(
      gender: gender ?? this.gender,
      name: name ?? this.name,
      location: location ?? this.location,
      email: email ?? this.email,
      login: login ?? this.login,
      dob: dob ?? this.dob,
      registered: registered ?? this.registered,
      phone: phone ?? this.phone,
      cell: cell ?? this.cell,
      id: id ?? this.id,
      picture: picture ?? this.picture,
      nat: nat ?? this.nat,
    );
  }
}
