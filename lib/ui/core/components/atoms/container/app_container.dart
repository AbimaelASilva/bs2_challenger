import 'package:flutter/material.dart';

import '../../../theme/theme_data_dark.dart';

///
class AppContainer extends StatelessWidget {
  ///
  const AppContainer({
    super.key,
    required this.child,
    this.width,
    this.color,
    this.borderColor,
    this.elevation = 0,
    this.borderRadius,
    this.padding,
    this.height,
  });

  ///
  final Widget child;

  ///
  final double? width;

  ///
  final double? height;

  ///
  final Color? color;

  ///
  final Color? borderColor;

  final int elevation;

  final BorderRadius? borderRadius;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      padding: padding ??
          const EdgeInsets.all(AppSpacing.nano).copyWith(
            top: AppSpacing.xxs,
            bottom: AppSpacing.xxs,
          ),
      decoration: BoxDecoration(
        //  color: color,
        border: elevation == 0
            ? AppBorderWidths.hairline(
                color: borderColor ?? Theme.of(context).colorScheme.outline,
              )
            : null,
        borderRadius: borderRadius ?? AppBorderRadius.lg,
        // boxShadow: [
        //   BoxShadow(
        //     //  color: Colors.black.withValues(alpha: 12),
        //     blurRadius: elevation * 8,
        //     offset: Offset(0, elevation * 4),
        //   ),
        // ],
      ),
      child: child,
    );
  }
}
