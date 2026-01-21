import 'package:flutter/material.dart';

import '../../../../theme/theme_data_dark.dart';

///
class AppCardData extends StatelessWidget {
  ///
  const AppCardData({
    super.key,
    required this.title,
    required this.value,
    this.height,
    this.width,
    this.color,
    this.titleStyle,
    this.valueStyle,
    this.onTap,
    this.icon,
  });

  final String title;

  final String value;

  final double? height;

  final double? width;

  final Color? color;

  final TextStyle? titleStyle;

  final TextStyle? valueStyle;

  final void Function()? onTap;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? AppColor.neutral.white,
          borderRadius: BorderRadius.circular(AppSpacing.nano),
          boxShadow: [
            BoxShadow(
              blurRadius: AppSpacing.nano,
              offset: const Offset(0, 4),
              color: Colors.black.withValues(alpha: 0.12),
            ),
          ],
        ),
        height: height,
        width: width ?? double.maxFinite,
        padding: const EdgeInsets.all(AppSpacing.xxs),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: titleStyle ?? AppTypografy.bodyRegular,
                  overflow: TextOverflow.ellipsis,
                ),
                icon ?? const SizedBox(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.nano),
              child: Text(
                value,
                style: valueStyle ??
                    AppTypografy.h3.copyWith(
                      color: AppColor.primary.medium,
                      fontSize: AppFontSize.lg,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
