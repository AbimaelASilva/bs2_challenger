import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Modern, accessible theme system for Field Map app
class AppTheme {
  AppTheme._();

  // Color palette - Nature-inspired with accessibility in mind
  static const Color primaryGreen = Color(0xFF2E7D32); // Deep forest green
  static const Color primaryGreenLight = Color(0xFF4CAF50); // Vibrant green
  static const Color primaryGreenDark = Color(0xFF1B5E20); // Dark forest

  static const Color secondaryOrange = Color(0xFFFF9800); // Warm orange
  static const Color secondaryOrangeLight = Color(0xFFFFB74D);
  static const Color secondaryOrangeDark = Color(0xFFE65100);

  static const Color errorRed = Color(0xFFD32F2F);
  static const Color warningAmber = Color(0xFFFFA000);
  static const Color successGreen = Color(0xFF388E3C);
  static const Color infoBlue = Color(0xFF1976D2);

  // Neutral colors for text and surfaces
  static const Color surfaceLight = Color(0xFFFAFAFA);
  static const Color surfaceDark = Color(0xFF121212);
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF0A0A0A);

  // Text colors with proper contrast ratios
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textOnDark = Color(0xFFFFFFFF);
  static const Color textSecondaryOnDark = Color(0xFFB0B0B0);

  // Spacing system (8pt grid)
  static const double spacingXS = 4.0;
  static const double spacingSM = 8.0;
  static const double spacingMD = 16.0;
  static const double spacingLG = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Border radius system
  static const double radiusSM = 4.0;
  static const double radiusMD = 8.0;
  static const double radiusLG = 12.0;
  static const double radiusXL = 16.0;
  static const double radiusXXL = 24.0;

  // Elevation system
  static const double elevationNone = 0.0;
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;
  static const double elevationMax = 16.0;

  /// Light theme with modern Material 3 design
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color scheme
      colorScheme: ColorScheme.light(
        primary: primaryGreen,
        onPrimary: Colors.white,
        primaryContainer: primaryGreenLight.withOpacity(0.1),
        onPrimaryContainer: primaryGreenDark,
        secondary: secondaryOrange,
        onSecondary: Colors.white,
        secondaryContainer: secondaryOrangeLight.withOpacity(0.1),
        onSecondaryContainer: secondaryOrangeDark,
        surface: surfaceLight,
        onSurface: textPrimary,
        surfaceContainerHighest: Colors.white,
        background: backgroundLight,
        onBackground: textPrimary,
        error: errorRed,
        onError: Colors.white,
        outline: textDisabled,
        outlineVariant: textDisabled.withOpacity(0.3),
        shadow: Colors.black.withOpacity(0.1),
      ),

      // Typography with proper hierarchy
      textTheme: _buildTextTheme(Brightness.light),

      // AppBar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: elevationNone,
        scrolledUnderElevation: elevationLow,
        backgroundColor: backgroundLight,
        foregroundColor: textPrimary,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: _buildTextTheme(Brightness.light).titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: textPrimary,
            ),
      ),

      // Card theme
      cardTheme: CardTheme(
        elevation: elevationLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLG),
        ),
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black.withOpacity(0.1),
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: elevationNone,
          padding: const EdgeInsets.symmetric(
            horizontal: spacingLG,
            vertical: spacingMD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMD),
          ),
          textStyle: _buildTextTheme(Brightness.light).labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
          minimumSize: const Size(0, 48),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: spacingLG,
            vertical: spacingMD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMD),
          ),
          side: BorderSide(color: primaryGreen),
          textStyle: _buildTextTheme(Brightness.light).labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
          minimumSize: const Size(0, 48),
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: spacingMD,
            vertical: spacingSM,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMD),
          ),
          textStyle: _buildTextTheme(Brightness.light).labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ),

      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: elevationMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusXL),
        ),
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMD),
          borderSide: BorderSide(color: textDisabled.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMD),
          borderSide: BorderSide(color: textDisabled.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMD),
          borderSide: BorderSide(color: primaryGreen, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMD),
          borderSide: BorderSide(color: errorRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMD),
          borderSide: BorderSide(color: errorRed, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacingMD,
          vertical: spacingMD,
        ),
        labelStyle: _buildTextTheme(Brightness.light).bodyLarge?.copyWith(
              color: textSecondary,
            ),
        hintStyle: _buildTextTheme(Brightness.light).bodyLarge?.copyWith(
              color: textDisabled,
            ),
      ),

      // List tile theme
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacingMD,
          vertical: spacingSM,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMD),
        ),
        titleTextStyle: _buildTextTheme(Brightness.light).bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
        subtitleTextStyle:
            _buildTextTheme(Brightness.light).bodyMedium?.copyWith(
                  color: textSecondary,
                ),
      ),

      // Divider theme
      dividerTheme: DividerThemeData(
        color: textDisabled.withOpacity(0.2),
        thickness: 1,
        space: 1,
      ),

      // Bottom sheet theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: backgroundLight,
        elevation: elevationHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(radiusXL),
          ),
        ),
      ),

      // Dialog theme
      dialogTheme: DialogTheme(
        backgroundColor: backgroundLight,
        elevation: elevationHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusXL),
        ),
        titleTextStyle:
            _buildTextTheme(Brightness.light).headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
        contentTextStyle: _buildTextTheme(Brightness.light).bodyLarge,
      ),

      // Snackbar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: textPrimary,
        contentTextStyle:
            _buildTextTheme(Brightness.light).bodyMedium?.copyWith(
                  color: Colors.white,
                ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMD),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: elevationMedium,
      ),
    );
  }

  /// Dark theme with proper contrast and accessibility
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color scheme
      colorScheme: ColorScheme.dark(
        primary: primaryGreenLight,
        onPrimary: Colors.black,
        primaryContainer: primaryGreen.withOpacity(0.2),
        onPrimaryContainer: primaryGreenLight,
        secondary: secondaryOrangeLight,
        onSecondary: Colors.black,
        secondaryContainer: secondaryOrange.withOpacity(0.2),
        onSecondaryContainer: secondaryOrangeLight,
        surface: surfaceDark,
        onSurface: textOnDark,
        surfaceContainerHighest: const Color(0xFF1E1E1E),
        background: backgroundDark,
        onBackground: textOnDark,
        error: const Color(0xFFFF6B6B),
        onError: Colors.black,
        outline: textSecondaryOnDark,
        outlineVariant: textSecondaryOnDark.withOpacity(0.3),
        shadow: Colors.black.withOpacity(0.3),
      ),

      // Typography
      textTheme: _buildTextTheme(Brightness.dark),

      // AppBar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: elevationNone,
        scrolledUnderElevation: elevationLow,
        backgroundColor: backgroundDark,
        foregroundColor: textOnDark,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: _buildTextTheme(Brightness.dark).titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: textOnDark,
            ),
      ),

      // Card theme
      cardTheme: CardTheme(
        elevation: elevationLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLG),
        ),
        color: surfaceDark,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black.withOpacity(0.3),
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: elevationNone,
          padding: const EdgeInsets.symmetric(
            horizontal: spacingLG,
            vertical: spacingMD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMD),
          ),
          textStyle: _buildTextTheme(Brightness.dark).labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
          minimumSize: const Size(0, 48),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: spacingLG,
            vertical: spacingMD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMD),
          ),
          side: BorderSide(color: primaryGreenLight),
          textStyle: _buildTextTheme(Brightness.dark).labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
          minimumSize: const Size(0, 48),
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: spacingMD,
            vertical: spacingSM,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMD),
          ),
          textStyle: _buildTextTheme(Brightness.dark).labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ),

      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: elevationMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusXL),
        ),
        backgroundColor: primaryGreenLight,
        foregroundColor: Colors.black,
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMD),
          borderSide: BorderSide(color: textSecondaryOnDark.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMD),
          borderSide: BorderSide(color: textSecondaryOnDark.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMD),
          borderSide: BorderSide(color: primaryGreenLight, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMD),
          borderSide: BorderSide(color: const Color(0xFFFF6B6B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMD),
          borderSide: BorderSide(color: const Color(0xFFFF6B6B), width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacingMD,
          vertical: spacingMD,
        ),
        labelStyle: _buildTextTheme(Brightness.dark).bodyLarge?.copyWith(
              color: textSecondaryOnDark,
            ),
        hintStyle: _buildTextTheme(Brightness.dark).bodyLarge?.copyWith(
              color: textSecondaryOnDark.withOpacity(0.7),
            ),
      ),

      // List tile theme
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacingMD,
          vertical: spacingSM,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMD),
        ),
        titleTextStyle: _buildTextTheme(Brightness.dark).bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
        subtitleTextStyle:
            _buildTextTheme(Brightness.dark).bodyMedium?.copyWith(
                  color: textSecondaryOnDark,
                ),
      ),

      // Divider theme
      dividerTheme: DividerThemeData(
        color: textSecondaryOnDark.withOpacity(0.2),
        thickness: 1,
        space: 1,
      ),

      // Bottom sheet theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surfaceDark,
        elevation: elevationHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(radiusXL),
          ),
        ),
      ),

      // Dialog theme
      dialogTheme: DialogTheme(
        backgroundColor: surfaceDark,
        elevation: elevationHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusXL),
        ),
        titleTextStyle:
            _buildTextTheme(Brightness.dark).headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
        contentTextStyle: _buildTextTheme(Brightness.dark).bodyLarge,
      ),

      // Snackbar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: textOnDark,
        contentTextStyle: _buildTextTheme(Brightness.dark).bodyMedium?.copyWith(
              color: Colors.black,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMD),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: elevationMedium,
      ),
    );
  }

  /// Build text theme with proper hierarchy and accessibility
  static TextTheme _buildTextTheme(Brightness brightness) {
    final baseColor = brightness == Brightness.light ? textPrimary : textOnDark;
    final secondaryColor =
        brightness == Brightness.light ? textSecondary : textSecondaryOnDark;

    return TextTheme(
      // Display styles
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        color: baseColor,
        height: 1.12,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: baseColor,
        height: 1.16,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: baseColor,
        height: 1.22,
      ),

      // Headline styles
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: baseColor,
        height: 1.25,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: baseColor,
        height: 1.29,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: baseColor,
        height: 1.33,
      ),

      // Title styles
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: baseColor,
        height: 1.27,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: baseColor,
        height: 1.50,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: baseColor,
        height: 1.43,
      ),

      // Body styles
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: baseColor,
        height: 1.50,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: baseColor,
        height: 1.43,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: secondaryColor,
        height: 1.33,
      ),

      // Label styles
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: baseColor,
        height: 1.43,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: baseColor,
        height: 1.33,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: baseColor,
        height: 1.45,
      ),
    );
  }
}
