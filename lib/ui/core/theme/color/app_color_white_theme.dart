import 'package:flutter/material.dart';
import 'app_color.dart';

abstract class _Color {
  Color get dark;
  Color get medium;
  Color get light;
}

class AppColorDark {
  AppColorDark._();

  static $PrimaryColorSetDark get primary => const $PrimaryColorSetDark();
  static $SecondaryColorSetDark get secondary => const $SecondaryColorSetDark();
  static $NeutralColorSetDark get neutral => const $NeutralColorSetDark();
  static $SemanticColorSet get semantic => const $SemanticColorSet();
  static $ExtraColorSetDark get extra => const $ExtraColorSetDark();
}

class $PrimaryColorSetDark implements _Color {
  const $PrimaryColorSetDark();

  @override
  Color get dark => const Color(0xFFF9C034); // Claro no escuro

  @override
  Color get medium => const Color(0xFFFBD26A); // Acento visível

  @override
  Color get light => const Color(0xFFFCE19C); // Usado com moderação

  Color get lighter => const Color(0xFFFEF7E6);

  Color get lightest => const Color(0xFFFFFFFF);
}

class $SecondaryColorSetDark implements _Color {
  const $SecondaryColorSetDark();

  @override
  Color get dark => const Color(0xFFFF7A57);

  @override
  Color get medium => const Color(0xFFFF8766);

  @override
  Color get light => const Color(0xFFFEEBE5);

  Color get lightest => const Color(0xFFFFFFFF);
}

class $NeutralColorSetDark {
  const $NeutralColorSetDark();

  Color get dark => const Color(0xFFFFFFFF); // Inverso do claro

  Color get state => const Color(0xFFE6E6E6); // Gray 100

  Color get muted => const Color(0xFFCCCCCC); // Gray 200

  Color get light => const Color(0xFF999999); // Gray 400

  Color get smoke => const Color(0xFF666666); // Gray 600

  Color get snow => const Color(0xFF2B2B2B); // Gray 800

  Color get white => const Color(0xFF1A1A1A); // Preto real usado como "white"
}

class $ExtraColorSetDark {
  const $ExtraColorSetDark();

  Color get background => const Color(0xFF121212); // Fundo base do app

  Color get overlay => const Color(0xFF000000)
      .withAlpha((0.7 * 255).toInt()); // Transparência adaptada
}
