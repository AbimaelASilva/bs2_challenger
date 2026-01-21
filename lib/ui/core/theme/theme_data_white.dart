import 'package:flutter/material.dart';
import 'theme_data_dark.dart';

/// All configs for theme
ThemeData materialTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.neutral.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.neutral.white,
      elevation: 0,
    ),
    fontFamily: AppFontFamily.base,
    canvasColor: AppColor.neutral.white,
    textTheme: const TextTheme(),
    unselectedWidgetColor: AppColor.secondary.medium,
    dividerColor: AppColor.neutral.light,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: AppBorderRadius.lg,
        borderSide: BorderSide(color: AppColor.neutral.muted),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.lg,
        borderSide: BorderSide(color: AppColor.neutral.muted),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.lg,
        borderSide: BorderSide(color: AppColor.neutral.muted),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.lg,
        borderSide: BorderSide(color: AppColor.primary.dark),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.lg,
        borderSide: BorderSide(color: AppColor.semantic.danger),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.lg,
        borderSide: BorderSide(color: AppColor.semantic.danger),
      ),
      floatingLabelStyle: AppTypografy.bodyRegular.copyWith(
        color: AppColor.neutral.muted,
      ),
      errorStyle: AppTypografy.captionRegular.copyWith(
        color: AppColor.semantic.danger,
        height: 0,
      ),
    ),
  );
}
