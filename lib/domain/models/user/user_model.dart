import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../core/core.dart';

import 'address.dart';

class UserModel extends Equatable {
  String id;
  String name;
  final String userName;
  final String nickName;
  final String phone;
  final String password;
  final String confirmPassword;
  final String email;
  final String personalEmail;
  final DateTime? birthDate;
  final String cpf;
  final Address address;
  final String? profileImageUrl;
  final DateTime? createdAt;
  final String status;
  final UserGenderEnum gender;

  UserModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.nickName,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.email,
    required this.personalEmail,
    this.birthDate,
    required this.cpf,
    required this.address,
    required this.profileImageUrl,
    this.createdAt,
    required this.status,
    required this.gender,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? userName,
    String? nickName,
    String? phone,
    String? password,
    String? confirmPassword,
    String? email,
    String? personalEmail,
    DateTime? birthDate,
    String? cpf,
    Address? address,
    String? profileImageUrl,
    DateTime? createdAt,
    String? status,
    UserGenderEnum? gender,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      nickName: nickName ?? this.nickName,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      email: email ?? this.email,
      personalEmail: personalEmail ?? this.personalEmail,
      birthDate: birthDate ?? this.birthDate,
      cpf: cpf ?? this.cpf,
      address: address ?? this.address,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'userName': userName});
    result.addAll({'nickName': nickName});
    result.addAll({'phone': phone});
    result.addAll({'password': password});
    result.addAll({'confirmPassword': confirmPassword});
    result.addAll({'email': email});
    result.addAll({'personalEmail': personalEmail});
    if (birthDate != null) {
      result.addAll({'birthDate': birthDate!.toIso8601String()});
    }
    result.addAll({'cpf': cpf});
    result.addAll({'address': address.toMap()});
    result.addAll({'profileImageUrl': profileImageUrl});
    if (createdAt != null) {
      result.addAll({'registrationDate': createdAt!.toIso8601String()});
    }
    result.addAll({'status': status});
    result.addAll({'gender': gender.enumToString});

    return result;
  }

  Map<String, dynamic> toSave() {
    final result = <String, dynamic>{};

    result.addAll({"name": name});
    result.addAll({"userName": name.toUniqueLoginId()});
    if (phone.isNotEmpty) {
      result.addAll({"phone": "55${phone.removeSpecialChars}"});
    }
    result.addAll({"email": email});
    result.addAll({"personalEmail": personalEmail});

    if (password.isNotEmpty) {
      result.addAll({"password": password});
    }

    if (confirmPassword.isNotEmpty) {
      result.addAll({"passwordConfirm": confirmPassword});
    }

    if (birthDate != null) {
      result.addAll({"birthDate": birthDate!.toDateInternacional});
    }

    if (profileImageUrl != null) {
      result.addAll({"profileImageUrl": profileImageUrl});
    }

    result.addAll({"gender": gender.enumToString});

    return result;
  }

  Map<String, dynamic> toSaveUpdate() {
    final result = <String, dynamic>{};

    result.addAll({"name": name});

    if (phone.isNotEmpty) {
      result.addAll({"phone": "55${phone.removeSpecialChars}"});
    }

    result.addAll({"personalEmail": personalEmail});

    if (password.isNotEmpty) {
      result.addAll({"password": password});
    }

    if (confirmPassword.isNotEmpty) {
      result.addAll({"passwordConfirm": confirmPassword});
    }

    if (birthDate != null) {
      result.addAll({"birthDate": birthDate!.toDateInternacional});
    }

    if (profileImageUrl != null) {
      result.addAll({"profileImageUrl": profileImageUrl});
    }

    result.addAll({"gender": gender.enumToString});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    try {
      return UserModel(
        id: map['id']?.toString() ?? '',
        userName: map['userName']?.toString() ?? '',
        name: map['name']?.toString() ?? '',
        nickName: map['nickName']?.toString() ?? '',
        phone: map['phone']?.toString() ?? '',
        password: map['password']?.toString() ?? '',
        confirmPassword: map['confirmPassword']?.toString() ?? '',
        email: map['email']?.toString() ?? '',
        personalEmail: map['personalEmail']?.toString() ?? '',
        birthDate: map['birthDate'] != null
            ? DateTime.tryParse(map['birthDate'].toString())
            : null,
        cpf: map['cpf']?.toString() ?? '',
        address:
            map['address'] != null && map['address'] is Map<String, dynamic>
                ? Address.fromMap(map['address'] as Map<String, dynamic>)
                : Address.empty(),
        profileImageUrl: map['profileImageUrl']?.toString() ?? '',
        createdAt: map['registrationDate'] != null
            ? DateTime.tryParse(map['registrationDate'].toString())
            : null,
        status: map['status']?.toString() ?? '',
        gender: map['gender'] != null
            ? UserGenderEnum.other.enumFromString(map['gender'].toString())
            : UserGenderEnum.other,

        // groups: map['groupAdmins'] != null && map['groupAdmins'] is List
        //     ? (map['groupAdmins'] as List)
        //         .map((e) => GroupAdmin.fromMap(e as Map<String, dynamic>))
        //         .toList()
        //     : const [],
      );
    } catch (e) {
      // Em caso de erro, retorna um modelo vazio
      return UserModel.empty();
    }
  }

  factory UserModel.empty() {
    return UserModel(
      id: '',
      userName: '',
      name: '',
      nickName: '',
      phone: '',
      password: '',
      confirmPassword: '',
      email: '',
      personalEmail: '',
      cpf: '',
      address: Address.empty(),
      profileImageUrl: '',
      status: '',
      gender: UserGenderEnum.other,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, userName: $userName, nickName: $nickName, phone: $phone, password: $password, confirmPassword: $confirmPassword, email: $email, personalEmail: $personalEmail, birthDate: $birthDate, cpf: $cpf, address: $address, profileImageUrl: $profileImageUrl, registrationDate: $createdAt, status: $status, gender: $gender)';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        userName,
        nickName,
        phone,
        password,
        confirmPassword,
        email,
        personalEmail,
        birthDate,
        cpf,
        address,
        profileImageUrl,
        createdAt,
        status,
        gender,
      ];
}
