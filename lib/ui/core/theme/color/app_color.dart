import 'package:flutter/material.dart';

abstract class _Color {
  Color get dark;
  Color get medium;
  Color get light;
}

/// Return all colors
class AppColor {
  AppColor._();

  /// Primary color
  static $PrimaryColorSet get primary => const $PrimaryColorSet();

  /// Secondary color
  static $SecondaryColorSet get secondary => const $SecondaryColorSet();

  /// Neutral color
  static $NeutralColorSet get neutral => const $NeutralColorSet();

  /// Semantic color
  static $SemanticColorSet get semantic => const $SemanticColorSet();

  /// Extra color
  static $ExtraColorSet get extra => const $ExtraColorSet();
}

class $PrimaryColorSet implements _Color {
  const $PrimaryColorSet();

  @override
  Color get dark => const Color(0xFFC69006); // Primary 600

  @override
  Color get medium => const Color(0xFFF9C034); // Primary 500

  @override
  Color get light => const Color(0xFFFBD26A); // Primary 300

  Color get lighter => const Color(0xFFFCE19C); // Primary 100

  Color get lightest => const Color(0xFFFEF7E6); // Primary 50
}

class $SecondaryColorSet implements _Color {
  const $SecondaryColorSet();

  @override
  Color get dark => const Color(0xFFCC2C00); // Secondary 600

  @override
  Color get medium => const Color(0xFFFF7A57); // Secondary 500

  @override
  Color get light => const Color(0xFFFF8766); // Secondary 300

  Color get lightest => const Color(0xFFFEEBE5); // Secondary 50
}

class $NeutralColorSet {
  const $NeutralColorSet();

  Color get dark => const Color(0xFF2B2B2B); // Dark

  Color get state => const Color(0xFF666666); // State (Gray 606666660)

  Color get muted => const Color(0xFF999999); // Muted (Gray 400)

  Color get light => const Color(0xFFCCCCCC); // Gray 200

  Color get smoke => const Color(0xFFE6E6E6); // Gray 100

  Color get snow => const Color(0xFFEDF0F2); // Gray 50

  Color get white => const Color(0xFFFFFFFF); // White
}

class $SemanticColorSet {
  const $SemanticColorSet();

  Color get success => const Color(0xFF12B76A); // Success (Green 500)

  Color get warning => const Color(0xFFFDB022); // Warning (Orange 400)

  Color get danger => const Color(0xFFF04438); // Danger / Error (Red 500)

  Color get info => const Color(0xFF4B61DD); // Info (Blue 400)
}

class $ExtraColorSet {
  const $ExtraColorSet();

  Color get background => const Color(0xFFF2F4F7); // Background

  Color get overlay => const Color(0xFF232933).withValues(alpha: 0.8); // Overlay
}
