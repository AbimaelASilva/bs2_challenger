import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../core/core.dart';
import '../../core/localization/localization.dart';

class AppCustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppCustomAppbarWidget({
    super.key,
    required this.user,
    this.loginStep,
  });

  final UserModel user;
  final void Function()? loginStep;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const ThemeAwareLogo(width: 50),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: AppFontSize.xs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.userName.isEmpty
                        ? context.tr.home.helloVisitor
                        : "${context.tr.home.hi}, ${user.name.firstWord}!",
                    style: AppTypografy.h4Regular,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  if (user.phone.isNotEmpty)
                    Text(
                      user.phone,
                      style: AppTypografy.h4Semi
                          .copyWith(fontSize: AppFontSize.xxxxs),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        if (loginStep != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(AppIconFont.profile),
              onPressed: loginStep!.call,
            ),
          ),
      ],
    );
  }
}
