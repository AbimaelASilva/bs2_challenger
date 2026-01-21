import 'package:flutter/material.dart';

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
  static $SemanticColorSetDark get semantic => const $SemanticColorSetDark();
  static $ExtraColorSetDark get extra => const $ExtraColorSetDark();
}

// Primary: Acentos modernos dourados/amarelos para destaque
class $PrimaryColorSetDark implements _Color {
  const $PrimaryColorSetDark();

  @override
  Color get dark => const Color(0xFFB38F00); // Amarelo queimado

  @override
  Color get medium => const Color(0xFFFFC107); // Amarelo vibrante (botões)

  @override
  Color get light => const Color(0xFFFFD54F); // Hover / realce

  Color get lighter => const Color(0xFFFFECB3); // Superfícies suaves

  Color get lightest => const Color(0xFFFFF8E1); // Destaques mínimos
}

// Secondary: Coral/laranja adaptado para escuro
class $SecondaryColorSetDark implements _Color {
  const $SecondaryColorSetDark();

  @override
  Color get dark => const Color(0xFFCC4C36); // Coral escuro

  @override
  Color get medium => const Color(0xFFFF7043); // Coral médio

  @override
  Color get light => const Color(0xFFFFAB91); // Realce leve

  Color get lightest => const Color(0xFFFFEDE7); // Fundo de destaque
}

// Neutral: escala de cinzas para texto, ícones, bordas
class $NeutralColorSetDark {
  const $NeutralColorSetDark();

  Color get white => const Color(0xFF121212); // Fundo real

  Color get snow => const Color(0xFF1E1E1E); // Cards e superfícies elevadas

  Color get smoke => const Color(0xFF2C2C2C); // Bordas e contornos

  Color get light => const Color(0xFF4D4D4D); // Texto secundário

  Color get muted => const Color(0xFF888888); // Ícones e elementos neutros

  Color get state => const Color(0xFFBDBDBD); // Texto claro

  Color get dark => const Color(0xFFE0E0E0); // Texto principal
}

// Extra: fundo, overlay, borda, etc
class $ExtraColorSetDark {
  const $ExtraColorSetDark();

  Color get background => const Color(0xFF0D0D0D); // Fundo absoluto

  Color get surface => const Color(0xFF1A1A1A); // Cards / containers

  Color get overlay =>
      const Color(0xFF000000).withValues(alpha: 0.6); // Overlays

  Color get border => const Color(0xFF2B2B2B); // Borda leve
}

// Semantic: estados visuais como erro, sucesso, aviso
class $SemanticColorSetDark {
  const $SemanticColorSetDark();

  Color get error => const Color(0xFFEF5350); // Vermelho suave
  Color get warning => const Color(0xFFFFA726); // Laranja suave
  Color get success => const Color(0xFF66BB6A); // Verde suave
  Color get info => const Color(0xFF42A5F5); // Azul suave
}
