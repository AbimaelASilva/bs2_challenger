import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF7F13EC);

  static const Color backgroundLight = Color(0xFFF2F2F7);
  static const Color backgroundDark = Color(0xFF000000);

  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1C1C1E);

  static const Color slate900 = Color(0xFF0F172A);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate300 = Color(0xFFCBD5E1);
  static const Color slate200 = Color(0xFFE2E8F0);
  static const Color slate100 = Color(0xFFF1F5F9);
  static const Color slate800 = Color(0xFF1E293B);

  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? backgroundDark
        : backgroundLight;
  }

  static Color getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? cardDark
        : cardLight;
  }

  static Color getBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white.withValues(alpha: 0.1)
        : slate200;
  }

  static Color getSlate500(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? slate400
        : slate500;
  }

  static const Color slate600 = Color(0xFF475569);

  static const Color error = Color(0xFFEF4444);
  static const Color errorDark = Color(0xFFDC2626);

  static Color getSlate300(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? slate600
        : slate300;
  }

  static Color getErrorColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? errorDark : error;
  }

  static Color getShadowColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black.withValues(alpha: 0.3)
        : Colors.black.withValues(alpha: 0.05);
  }
}
