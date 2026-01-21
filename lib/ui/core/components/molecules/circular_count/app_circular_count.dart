import 'package:flutter/material.dart';

import '../../../core.dart';

class AppCircularCount extends StatelessWidget {
  const AppCircularCount({
    super.key,
    this.amount,
    this.width,
    this.height,
    required this.value,
  });

  final int? amount;
  final double? width;
  final double? height;
  final String value;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      width: width ?? 24,
      height: height ?? 24,
      borderRadius: BorderRadius.circular(40),
      padding: EdgeInsets.zero,
      child: Center(
        child: Text(
          value,
          style: AppTypografy.bodyRegular.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
