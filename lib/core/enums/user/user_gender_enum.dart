// "gender": "M" // OPCIONAL (ALLOW VALUES M, F, OTHER, NOT-INFO)

import 'package:flutter/widgets.dart';

import '../../../ui/core/localization/localization.dart';

enum UserGenderEnum { male, female, other }

extension UserGenderEnumEnumExtension on UserGenderEnum {
  String label(BuildContext context) {
    switch (this) {
      case UserGenderEnum.male:
        return context.tr.signUp.male;
      case UserGenderEnum.female:
        return context.tr.signUp.female;
      case UserGenderEnum.other:
        return context.tr.signUp.other;
    }
  }

  String get enumToString {
    switch (this) {
      case UserGenderEnum.male:
        return 'M';
      case UserGenderEnum.female:
        return 'F';
      case UserGenderEnum.other:
        return 'OTHER';
    }
  }

  UserGenderEnum enumFromString(String text) {
    switch (text) {
      case "M":
        return UserGenderEnum.male;
      case "F":
        return UserGenderEnum.female;
      case "OTHER":
      default:
        return UserGenderEnum.other;
    }
  }
}
