import 'dart:convert';

import '../../domain.dart';

class AdminModel {
  String id;
  String userId;
  final String groupId;
  final String createdAt;
  final String updatedAt;
  final UserModel user;
  AdminModel({
    required this.id,
    required this.userId,
    required this.groupId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  AdminModel copyWith({
    String? id,
    String? userId,
    String? groupId,
    String? createdAt,
    String? updatedAt,
    UserModel? user,
  }) {
    return AdminModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      groupId: groupId ?? this.groupId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userId': userId});
    result.addAll({'groupId': groupId});
    result.addAll({'createdAt': createdAt});
    result.addAll({'updatedAt': updatedAt});
    result.addAll({'user': user.toMap()});

    return result;
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: map['id']?.toString() ?? '',
      userId: map['userId']?.toString() ?? '',
      groupId: map['groupId']?.toString() ?? '',
      user: map['expand'] != null
          ? UserModel.fromMap(map['expand']['userId'] as Map<String, dynamic>)
          : UserModel.empty(),
      createdAt: map['createdAt']?.toString() ?? '',
      updatedAt: map['updatedAt']?.toString() ?? '',
    );
  }

  factory AdminModel.empty() {
    return AdminModel(
      id: '',
      userId: '',
      groupId: '',
      createdAt: '',
      updatedAt: '',
      user: UserModel.empty(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminModel.fromJson(String source) =>
      AdminModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdminModel(id: $id, userId: $userId, groupId: $groupId, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdminModel &&
        other.id == id &&
        other.userId == userId &&
        other.groupId == groupId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        groupId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        user.hashCode;
  }
}
