import '../../domain/domain.dart';
import 'dob_model.dart';
import 'id_model.dart';
import 'location_model.dart';
import 'login_model.dart';
import 'name_model.dart';
import 'picture_model.dart';
import 'registered_model.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.gender,
    required super.name,
    required super.location,
    required super.email,
    required super.login,
    required super.dob,
    required super.registered,
    required super.phone,
    required super.cell,
    required super.id,
    required super.picture,
    required super.nat,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('results')) {
      final results = json['results'] as List<dynamic>?;
      if (results == null || results.isEmpty) {
        return UserModel(
          gender: '',
          name: NameModel.fromJson({}),
          location: LocationModel.fromJson({}),
          email: '',
          login: LoginModel.fromJson({}),
          dob: DobModel.fromJson({}),
          registered: RegisteredModel.fromJson({}),
          phone: '',
          cell: '',
          id: IdModel.fromJson({}),
          picture: PictureModel.fromJson({}),
          nat: '',
        );
      }

      final firstResult = results[0] as Map<String, dynamic>;
      
      return UserModel(
        gender: firstResult['gender']?.toString() ?? '',
        name: NameModel.fromJson(firstResult['name'] as Map<String, dynamic>? ?? {}),
        location: LocationModel.fromJson(
          firstResult['location'] as Map<String, dynamic>? ?? {},
        ),
        email: firstResult['email']?.toString() ?? '',
        login: LoginModel.fromJson(
          firstResult['login'] as Map<String, dynamic>? ?? {},
        ),
        dob: DobModel.fromJson(firstResult['dob'] as Map<String, dynamic>? ?? {}),
        registered: RegisteredModel.fromJson(
          firstResult['registered'] as Map<String, dynamic>? ?? {},
        ),
        phone: firstResult['phone']?.toString() ?? '',
        cell: firstResult['cell']?.toString() ?? '',
        id: IdModel.fromJson(firstResult['id'] as Map<String, dynamic>? ?? {}),
        picture: PictureModel.fromJson(
          firstResult['picture'] as Map<String, dynamic>? ?? {},
        ),
        nat: firstResult['nat']?.toString() ?? '',
      );
    }

    return UserModel(
      gender: json['gender']?.toString() ?? '',
      name: NameModel.fromJson(json['name'] as Map<String, dynamic>? ?? {}),
      location: LocationModel.fromJson(
        json['location'] as Map<String, dynamic>? ?? {},
      ),
      email: json['email']?.toString() ?? '',
      login: LoginModel.fromJson(
        json['login'] as Map<String, dynamic>? ?? {},
      ),
      dob: DobModel.fromJson(json['dob'] as Map<String, dynamic>? ?? {}),
      registered: RegisteredModel.fromJson(
        json['registered'] as Map<String, dynamic>? ?? {},
      ),
      phone: json['phone']?.toString() ?? '',
      cell: json['cell']?.toString() ?? '',
      id: IdModel.fromJson(json['id'] as Map<String, dynamic>? ?? {}),
      picture: PictureModel.fromJson(
        json['picture'] as Map<String, dynamic>? ?? {},
      ),
      nat: json['nat']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'name': name is NameModel ? (name as NameModel).toJson() : NameModel.fromEntity(name).toJson(),
      'location': location is LocationModel ? (location as LocationModel).toJson() : LocationModel.fromEntity(location).toJson(),
      'email': email,
      'login': login is LoginModel ? (login as LoginModel).toJson() : LoginModel.fromEntity(login).toJson(),
      'dob': dob is DobModel ? (dob as DobModel).toJson() : DobModel.fromEntity(dob).toJson(),
      'registered': registered is RegisteredModel ? (registered as RegisteredModel).toJson() : RegisteredModel.fromEntity(registered).toJson(),
      'phone': phone,
      'cell': cell,
      'id': id is IdModel ? (id as IdModel).toJson() : IdModel.fromEntity(id).toJson(),
      'picture': picture is PictureModel ? (picture as PictureModel).toJson() : PictureModel.fromEntity(picture).toJson(),
      'nat': nat,
    };
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      gender: entity.gender,
      name: NameModel.fromEntity(entity.name),
      location: LocationModel.fromEntity(entity.location),
      email: entity.email,
      login: LoginModel.fromEntity(entity.login),
      dob: DobModel.fromEntity(entity.dob),
      registered: RegisteredModel.fromEntity(entity.registered),
      phone: entity.phone,
      cell: entity.cell,
      id: IdModel.fromEntity(entity.id),
      picture: PictureModel.fromEntity(entity.picture),
      nat: entity.nat,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      gender: gender,
      name: name is NameModel ? (name as NameModel).toEntity() : name,
      location: location is LocationModel ? (location as LocationModel).toEntity() : location,
      email: email,
      login: login is LoginModel ? (login as LoginModel).toEntity() : login,
      dob: dob is DobModel ? (dob as DobModel).toEntity() : dob,
      registered: registered is RegisteredModel ? (registered as RegisteredModel).toEntity() : registered,
      phone: phone,
      cell: cell,
      id: id is IdModel ? (id as IdModel).toEntity() : id,
      picture: picture is PictureModel ? (picture as PictureModel).toEntity() : picture,
      nat: nat,
    );
  }
}
