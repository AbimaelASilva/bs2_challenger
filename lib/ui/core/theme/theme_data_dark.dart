import 'package:flutter/material.dart';

import 'color/app_color.dart';
import 'color/app_color_dark_theme.dart';

export 'border/border.dart';
export 'color/color.dart';
export 'spacing/spacing.dart';
export 'theme_data_white.dart';
export 'typografy/typografy.dart';

ThemeData materialTheme() {
  // ... seu tema claro existente ...
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.primary.medium,
    // ... demais configs ...
  );
}

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColorDark.extra.background,
    cardColor: AppColorDark.neutral.snow,
    primaryColor: AppColorDark.primary.medium,
    colorScheme: ColorScheme.dark(
      primary: AppColorDark.primary.medium,
      secondary: AppColorDark.secondary.medium,
      surface: AppColorDark.neutral.snow,
      onSecondary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorDark.extra.background,
      foregroundColor: AppColorDark.neutral.dark,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColorDark.neutral.dark),
      bodyMedium: TextStyle(color: AppColorDark.neutral.light),
      bodySmall: TextStyle(color: AppColorDark.neutral.light),
      titleLarge: TextStyle(
          color: AppColorDark.neutral.dark, fontWeight: FontWeight.bold,),
      titleMedium: TextStyle(color: AppColorDark.neutral.dark),
      titleSmall: TextStyle(color: AppColorDark.neutral.light),
    ),
    iconTheme: IconThemeData(color: AppColorDark.neutral.dark),
    dividerColor: AppColorDark.neutral.smoke,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColorDark.primary.medium,
      foregroundColor: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorDark.neutral.snow,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: AppColorDark.neutral.light),
      labelStyle: TextStyle(color: AppColorDark.neutral.dark),


      
    ),
    // Adicione outros componentes conforme necessário
  );
}
