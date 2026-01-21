import 'package:flutter/material.dart';

import '../../../core.dart';

///
class AppBottomSheet extends StatelessWidget {
  ///
  const AppBottomSheet({
    super.key,
    required this.children,
    this.title,
    this.backgroundColor,
    this.height,
    this.padding,
    this.crossAxisAlignment,
    this.borderRadius,
    this.titleAlign,
    this.onClose,
    this.bottom,
  });

  final Widget? title;
  final Widget? bottom;

  ///
  final Color? backgroundColor;

  ///
  final List<Widget> children;

  /// Maximum height. Default value 136.0.
  final double? height;

  ///
  final EdgeInsets? padding;

  /// Cross axis alignment. [CrossAxisAlignment.start] default value.
  final CrossAxisAlignment? crossAxisAlignment;

  ///
  final BorderRadius? borderRadius;

  final MainAxisAlignment? titleAlign;

  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ??
            const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
      ),
      padding: padding ??
          const EdgeInsets.all(AppSpacing.sm).copyWith(top: AppSpacing.xxxs),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: titleAlign ?? MainAxisAlignment.start,
                children: [
                  if (title != null)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: title,
                      ),
                    ),
                  // Botão de fechar no topo direito
                  IconButton(
                    iconSize: 36,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.close,
                      size: 36,
                      color: AppColor.primary.dark,
                    ),
                    onPressed: onClose ?? () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              ...children,
              if (bottom != null) bottom!,
            ],
          ),
        ],
      ),
    );
  }
}
