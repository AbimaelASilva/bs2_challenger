import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import 'assets.gen.dart';

/// Widget que exibe a logo apropriada baseada no tema atual
///
/// Automaticamente alterna entre logoWhite (para tema escuro) e logoBlack (para tema claro)
class ThemeAwareLogo extends StatelessWidget {
  const ThemeAwareLogo({
    super.key,
    this.height,
    this.width,
    this.fit,
  });

  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return isDark
        ? AppAssets.images.png.logoWhite.image(
            height: height,
            width: width,
            fit: fit,
          )
        : AppAssets.images.png.logoBlack.image(
            height: height,
            width: width,
            fit: fit,
          );
  }
}
