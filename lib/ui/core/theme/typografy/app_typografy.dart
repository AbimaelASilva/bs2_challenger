import 'package:flutter/material.dart';

import '../theme_data_dark.dart';

/// All typografy
class AppTypografy {
  /// Headding1
  ///
  /// Font size: 24px
  ///
  /// Line height: 30px -- +25%
  ///
  /// Font Weight: SemiBold -- w600
  ///
  ///
  ///
  ////*
  ///
  /*
    static TextStyle get h1 => TextStyle(
        fontSize: AppFontSize.lg,
        fontWeight: AppFontWeight.semiBold,
       // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.25,
      );
   */

  static TextStyle get h1 => const TextStyle(
        fontSize: AppFontSize.lg,
        fontWeight: AppFontWeight.semiBold,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.25,
      );

  /// Headding2
  ///
  /// Font size: 20px
  ///
  /// Line height: 24px -- +20%
  ///
  /// Font Weight: Bold -- w700
  ///
  static TextStyle get h2 => const TextStyle(
        fontSize: AppFontSize.md,
        fontWeight: AppFontWeight.bold,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.2,
      );

  /// Headding3
  ///
  /// Font size: 18px
  ///
  /// Line height: 30px -- +25%
  ///
  /// Font Weight: SemiBold -- w600
  ///
  static TextStyle get h3 => const TextStyle(
        fontSize: AppFontSize.sm,
        fontWeight: AppFontWeight.semiBold,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.22,
      );

  /// Headding4
  ///
  /// Font size: 16px
  ///
  /// Line height: 22px -- +38%
  ///
  /// Font Weight: Regular -- w400
  ///
  static TextStyle get h4Regular => const TextStyle(
        fontSize: AppFontSize.xs,
        fontWeight: AppFontWeight.regular,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.38,
      );

  /// Headding4
  ///
  /// Font size: 16px
  ///
  /// Line height: 22px -- +38%
  ///
  /// Font Weight: SemiBold -- w600
  ///
  static TextStyle get h4Semi => const TextStyle(
        fontSize: AppFontSize.xs,
        fontWeight: AppFontWeight.semiBold,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.38,
      );

  /// Title
  ///
  /// Font size: 18px
  ///
  /// Line height: 24px -- +33%
  ///
  /// Font Weight: Regular -- w500
  ///
  static TextStyle get title => const TextStyle(
        fontSize: AppFontSize.sm,
        fontWeight: AppFontWeight.medium,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.33,
      );

  /// Body
  ///
  /// Font size: 14px
  ///
  /// Line height: 24px -- +43%
  ///
  /// Font Weight: Regular -- w400
  ///
  static TextStyle get bodyRegular => const TextStyle(
        fontSize: AppFontSize.xxs,
        fontWeight: AppFontWeight.regular,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.43,
      );

  /// Body
  ///
  /// Font size: 14px
  ///
  /// Line height: 24px -- +43%
  ///
  /// Font Weight: Semi Bold -- w600
  ///
  static TextStyle get bodySemi => const TextStyle(
        fontSize: AppFontSize.xxs,
        fontWeight: AppFontWeight.semiBold,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.43,
      );

  /// Caption
  ///
  /// Font size: 12px
  ///
  /// Line height: 16px -- +33%
  ///
  /// Font Weight: Regular -- w400
  ///
  static TextStyle get captionRegular => const TextStyle(
        fontSize: AppFontSize.xxxs,
        fontWeight: AppFontWeight.regular,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.33,
      );

  /// Caption
  ///
  /// Font size: 12px
  ///
  /// Line height: 16px -- +33%
  ///
  /// Font Weight: Semi Bold -- w600
  ///
  static TextStyle get captionSemi => const TextStyle(
        fontSize: AppFontSize.xxxs,
        fontWeight: AppFontWeight.semiBold,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.33,
      );

  /// Caption
  ///
  /// Font size: 12px
  ///
  /// Line height: 14px -- +33%
  ///
  /// Font Weight: Semi Bold -- w400
  ///
  static TextStyle get labelRegular => const TextStyle(
        fontSize: AppFontSize.xxxxs,
        fontWeight: AppFontWeight.regular,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.33,
      );

  /// Caption
  ///
  /// Font size: 12px
  ///
  /// Line height: 14px -- +33%
  ///
  /// Font Weight: Semi Bold -- w600
  ///
  static TextStyle get labelSemi => const TextStyle(
        fontSize: AppFontSize.xxxxs,
        fontWeight: AppFontWeight.semiBold,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.33,
      );

  /// Button Primary
  ///
  /// Font size: 16px
  ///
  /// Line height: 22px -- +38%
  ///
  /// Font Weight: Bold -- w700
  ///
  static TextStyle get buttonPrimary => const TextStyle(
        fontSize: AppFontSize.xs,
        fontWeight: AppFontWeight.bold,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.38,
      );

  /// Button Secondary
  ///
  /// Font size: 16px
  ///
  /// Line height: 22px -- +38%
  ///
  /// Font Weight: Semi Bold -- w600
  ///
  static TextStyle get buttonSecondary => const TextStyle(
        fontSize: AppFontSize.xs,
        fontWeight: AppFontWeight.semiBold,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.38,
      );

  /// Button Tertiary
  ///
  /// Font size: 16px
  ///
  /// Line height: 22px -- +38%
  ///
  /// Font Weight: Semi Bold -- w600
  ///
  static TextStyle get buttonTertiary => const TextStyle(
        fontSize: AppFontSize.xxs,
        fontWeight: AppFontWeight.semiBold,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.38,
      );

  /// Button Link
  ///
  /// Font size: 14px
  ///
  /// Line height: 20px -- +43%
  ///
  /// Font Weight: Semi Bold -- w700
  ///
  static TextStyle get buttonLink => const TextStyle(
        fontSize: AppFontSize.xxs,
        fontWeight: AppFontWeight.bold,
        // color: AppColor.neutral.dark,
        fontFamily: AppFontFamily.base,
        height: 1.43,
      );
}
