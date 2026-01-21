import 'package:flutter/services.dart';

class DateFormatterHelper {
  static TextInputFormatter get monthYearFormatter => _MonthYearFormatter();
  static TextInputFormatter get dateFormatter => _DateFormatter();
}

class _MonthYearFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    // Remove any non-digit characters
    final digits = text.replaceAll(RegExp(r'[^\d]'), '');

    if (digits.isEmpty) return newValue;

    // Format as MM/YYYY
    String formatted = '';
    if (digits.length <= 2) {
      // Only month
      formatted = digits;
    } else {
      // Month and year
      final month = digits.substring(0, 2);
      final year = digits.substring(2);

      // Validate month (01-12)
      final monthNum = int.tryParse(month) ?? 0;
      if (monthNum > 12) {
        return oldValue;
      }

      formatted = '$month/${year.length > 4 ? year.substring(0, 4) : year}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class _DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    // Remove any non-digit characters
    final digits = text.replaceAll(RegExp(r'[^\d]'), '');

    if (digits.isEmpty) return newValue;

    // Format as DD/MM/YYYY
    String formatted = '';
    if (digits.length <= 2) {
      // Only day
      formatted = digits;
    } else if (digits.length <= 4) {
      // Day and month
      final day = digits.substring(0, 2);
      final month = digits.substring(2);

      // Validate day (01-31)
      final dayNum = int.tryParse(day) ?? 0;
      if (dayNum > 31) {
        return oldValue;
      }

      formatted = '$day/$month';
    } else {
      // Day, month and year
      final day = digits.substring(0, 2);
      final month = digits.substring(2, 4);
      final year = digits.substring(4);

      // Validate day (01-31)
      final dayNum = int.tryParse(day) ?? 0;
      if (dayNum > 31) {
        return oldValue;
      }

      // Validate month (01-12)
      final monthNum = int.tryParse(month) ?? 0;
      if (monthNum > 12) {
        return oldValue;
      }

      formatted =
          '$day/$month/${year.length > 4 ? year.substring(0, 4) : year}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
