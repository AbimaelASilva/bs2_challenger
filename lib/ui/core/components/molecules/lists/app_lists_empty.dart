
import 'package:flutter/material.dart';

import '../../../core.dart';

class AppListsEmpty extends StatelessWidget {
  AppListsEmpty({super.key, required this.label, this.icon});


  final String label;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody:
              false, // Faz o SliverFillRemaining ocupar o espaço todo e centralizar os filhos
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon == null)
                Icon(
                  Icons.sports_soccer,
                  size: 32,
                  color: AppColor.neutral.light,
                )
              else
                icon!,
              Text(
                label,
                style: AppTypografy.bodyRegular.copyWith(
                  color: AppColor.neutral.light,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
