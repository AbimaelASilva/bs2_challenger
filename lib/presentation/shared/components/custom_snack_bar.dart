import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';

enum SnackBarType { success, error, info }

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          _getIcon(type),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: _getBackgroundColor(context, type),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      margin: const EdgeInsets.all(AppSpacing.xl),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static Widget _getIcon(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return const Icon(Icons.check_circle_outline, color: Colors.white);
      case SnackBarType.error:
        return const Icon(Icons.error_outline, color: Colors.white);
      case SnackBarType.info:
        return const Icon(Icons.info_outline, color: Colors.white);
    }
  }

  static Color _getBackgroundColor(BuildContext context, SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Colors.green[600]!;
      case SnackBarType.error:
        return AppColors.getErrorColor(context);
      case SnackBarType.info:
        return AppColors.primary;
    }
  }
}
