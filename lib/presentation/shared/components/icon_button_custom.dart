import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_sizes.dart';

class IconButtonCustom extends StatelessWidget {
  const IconButtonCustom({
    super.key,
    required this.icon,
    this.onPressed,
    this.size,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusFull),
        child: Container(
          width: size ?? 40,
          height: size ?? 40,
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: AppSizes.iconSizeMedium,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
