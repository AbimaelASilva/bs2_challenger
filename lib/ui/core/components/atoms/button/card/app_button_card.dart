import 'package:flutter/material.dart';

import '../../../../theme/theme_data_dark.dart';

/// Return the component
class AppButtonCard extends StatelessWidget {
  /// [AppButtonCard] constructor
  const AppButtonCard({
    super.key,
    required this.title,
    this.description = '',
    required this.icon,
    this.selected = false,
    this.width,
    this.onPressed,
    this.constraints,
    this.contentCenter = false,
    this.titleColor,
    this.fontSize,
    this.descriptionColor,
  });

  /// Define border of the card
  final bool selected;

  /// Title of the card
  final String title;

  /// Description of card
  final String description;

  /// Icon used in card
  final Widget icon;

  /// Width of the card
  final double? width;

  /// Function to action
  final VoidCallback? onPressed;

  ///
  final BoxConstraints? constraints;

  /// Center content
  final bool contentCenter;

  /// Title color
  final Color? titleColor;

  /// Description color
  final Color? descriptionColor;

  /// Font size
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        constraints: constraints,
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.xs,
          horizontal: AppSpacing.xxxs,
        ),
        decoration: BoxDecoration(
          color: AppColor.neutral.white,
          borderRadius: AppBorderRadius.lg,
          border: selected
              ? AppBorderWidths.thin(
                  color: AppColor.primary.dark,
                )
              : AppBorderWidths.thin(
                  color: AppColor.neutral.light,
                ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              height: AppSpacing.nano,
            ),
            Text(
              title,
              style: AppTypografy.title.copyWith(
                fontSize: fontSize,
                color: titleColor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: contentCenter ? TextAlign.center : TextAlign.start,
            ),
            const SizedBox(
              height: AppSpacing.nano,
            ),
            Visibility(
              visible: description.isNotEmpty,
              child: Text(
                description,
                style: AppTypografy.bodyRegular.copyWith(
                  color: descriptionColor ?? AppColor.neutral.dark,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
