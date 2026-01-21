import 'package:flutter/material.dart';

import '../../../../core.dart';

///
class AppDefaultCard extends StatelessWidget {
  ///
  const AppDefaultCard({
    super.key,
    this.child,
    this.width,
    this.height,
  });

  final Widget? child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1F1F1F)
            : AppColor.neutral.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: child,
      ),
    );
  }
}
