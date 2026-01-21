import 'dart:convert';
import 'package:flutter/foundation.dart';

@immutable
class UserCredentials {
  final String userName;
  final String accessToken;
  final int expiresIn;
  final String refreshToken;

  const UserCredentials({
    required this.userName,
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
  });

  UserCredentials copyWith({
    String? accessToken,
    int? expiresIn,
    String? refreshToken,
  }) {
    return UserCredentials(
      userName: userName,
      accessToken: accessToken ?? this.accessToken,
      expiresIn: expiresIn ?? this.expiresIn,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'accessToken': accessToken,
      'expiresIn': expiresIn,
      'refreshToken': refreshToken,
    };
  }

  factory UserCredentials.fromMap(Map<String, dynamic> map) {
    return UserCredentials(
      userName: map['user']['userName']?.toString() ?? '',
      accessToken: map['credentials']['accessToken']?.toString() ?? '',
      expiresIn: int.tryParse(
            map['credentials']['expiresIn']?.toString() ?? '0',
          ) ??
          0,
      refreshToken: map['credentials']['refreshToken']?.toString() ?? '',
    );
  }
  factory UserCredentials.empty() {
    return const UserCredentials(
      userName: '',
      accessToken: '',
      expiresIn: 0,
      refreshToken: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCredentials.fromJson(String source) {
    final Map<String, dynamic> map =
        json.decode(source) as Map<String, dynamic>;
    return UserCredentials.fromMap(map);
  }

  @override
  String toString() =>
      'UserCredentials(userName: $userName, accessToken: $accessToken, expiresIn: $expiresIn, refreshToken: $refreshToken)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserCredentials &&
        other.userName == userName &&
        other.accessToken == accessToken &&
        other.expiresIn == expiresIn &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode =>
      userName.hashCode ^
      accessToken.hashCode ^
      expiresIn.hashCode ^
      refreshToken.hashCode;
}
