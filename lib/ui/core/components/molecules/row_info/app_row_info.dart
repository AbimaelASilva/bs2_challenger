import 'package:flutter/material.dart';

import '../../../theme/theme_data_dark.dart';

/// A reusable component that displays a row with an info icon and text.
class AppRowInfo extends StatelessWidget {
  /// Creates an [AppRowInfo] widget.
  const AppRowInfo({
    super.key,
    required this.text,
    this.icon = Icons.info_outline,
    this.iconColor,
    this.iconSize = 18,
    this.textStyle,
    this.spacing = 8,
  });

  /// The text to display next to the icon.
  final String text;

  /// The icon to display. Defaults to Icons.info_outline.
  final IconData icon;

  /// The color of the icon. Defaults to AppColor.neutral.muted.
  final Color? iconColor;

  /// The size of the icon. Defaults to 18.
  final double iconSize;

  /// The style for the text. Defaults to AppTypografy.bodyRegular with AppColor.neutral.muted.
  final TextStyle? textStyle;

  /// The spacing between the icon and text. Defaults to 8.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor ?? AppColor.neutral.muted,
          size: iconSize,
        ),
        SizedBox(width: spacing),
        Expanded(
          child: Text(
            text,
            style: textStyle ??
                AppTypografy.bodyRegular.copyWith(
                  color: AppColor.neutral.muted,
                ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
