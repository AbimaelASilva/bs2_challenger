import 'package:flutter/services.dart';

/// Formatter personalizado para campos de hora no formato HH:MM
/// Aceita apenas valores válidos (00:00 até 23:59)
class TimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    // Verifica se o texto contém apenas dígitos
    if (RegExp(r'^[0-9]+$').hasMatch(text)) {
      if (text.length > 4) {
        // Limita a 4 dígitos (formato HH:MM)
        return oldValue;
      }

      if (text.isNotEmpty) {
        // Verifica se o primeiro dígito é válido (0 ou 1 ou 2)
        final firstDigit = int.parse(text[0]);
        if (firstDigit > 2) {
          return oldValue;
        }
      }

      if (text.length >= 2) {
        // Se começar com 2, permite apenas 0-3 no segundo dígito
        final firstTwoDigits = int.parse(text.substring(0, 2));
        if (firstTwoDigits > 23) {
          return oldValue;
        }
      }

      if (text.length >= 3) {
        // Verifica se o terceiro dígito é válido (0-5)
        final thirdDigit = int.parse(text[2]);
        if (thirdDigit > 5) {
          return oldValue;
        }
      }
    }

    return newValue;
  }
}
