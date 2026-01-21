import 'package:flutter/widgets.dart';

import '../../../ui/core/localization/localization.dart';

enum UIError {
  empty, // Used to instantiate observable
  nameIsTooShort,
  requiredField,
  passwordsAreDifferent,
  invalidDate,
}

extension UIErrorExtension on UIError {
  String description(BuildContext context) {
    switch (this) {
      case UIError.nameIsTooShort:
        return context.tr.erros.nameIsTooShort;
      case UIError.requiredField:
        return context.tr.erros.requiredField;
      case UIError.passwordsAreDifferent:
        return context.tr.erros.passwordsAreDifferent;
      case UIError.invalidDate:
        return context.tr.erros.invalidDate;
      case UIError.empty:
        return '';
    }
  }
}
