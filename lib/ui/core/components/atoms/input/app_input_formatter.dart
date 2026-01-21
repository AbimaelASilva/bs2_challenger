import 'package:flutter/services.dart';

///
class AppInputFormatterLowerCaseTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue txtOld,
    TextEditingValue txtNew,
  ) {
    return txtNew.copyWith(text: txtNew.text.toLowerCase());
  }
}

///
class AppInputFormatterUpperCaseTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue txtOld,
    TextEditingValue txtNew,
  ) {
    return txtNew.copyWith(text: txtNew.text.toUpperCase());
  }
}

///
class AppInputFormatterTrimTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(text: newValue.text.trim());
  }
}
