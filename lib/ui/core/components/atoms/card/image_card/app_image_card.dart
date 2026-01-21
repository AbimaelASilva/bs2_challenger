import 'package:flutter/material.dart';

import '../../../../theme/theme_data_dark.dart';

/// Return onde card with background image
///
class AppImageCard extends StatelessWidget {
  /// [AppImageCard] constructor
  const AppImageCard({
    super.key,
    required this.image,
    this.borderRadius,
    this.height,
    this.width,
    this.boxFit = BoxFit.cover,
    this.hasShadow = false,
    this.onTap,
  });

  ///
  final BorderRadius? borderRadius;

  ///
  final double? width;

  ///
  final double? height;

  /// Provider widgets can be use, as NetworkImage(url)
  /// Use preferably ExtendedNetworkImageProvider
  final ImageProvider image;

  ///
  final void Function()? onTap;

  ///
  final BoxFit boxFit;

  /// Define if visible shadow
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.neutral.white,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.16),
                  offset: const Offset(0, 4),
                  blurRadius: 16,
                ),
              ]
            : null,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: width,
          height: height,
          child: ClipRRect(
            borderRadius: borderRadius ?? AppBorderRadius.sm,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.neutral.white,
                image: DecorationImage(fit: boxFit, image: image),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
