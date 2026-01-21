import 'package:flutter/material.dart';

import '../../../../../domain/models/user/user.dart';
import '../../../core.dart';
import '../../../localization/localization.dart';
import '../../../theme/theme_controller.dart';

/// A drawer specifically for user profile settings
class UserProfileDrawer extends StatelessWidget {
  const UserProfileDrawer({
    super.key,
    this.onLogout,
    this.backgroundColor,
    this.loginStep,
    required this.user,
    required this.myDatas,
    this.onThemeChanged,
    this.deleteAccount,
  });

  /// Callback function when logout is pressed
  final VoidCallback? onLogout;

  final VoidCallback? loginStep;

  final VoidCallback myDatas;

  final VoidCallback? deleteAccount;

  /// The color of the drawer background
  final Color? backgroundColor;

  final UserModel user;

  final VoidCallback? onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return AppDrawer(
      backgroundColor: backgroundColor,
      title: context.tr.app.profile,
      header: Column(
        children: [
          _buildHeader(context),
          ValueListenableBuilder<ThemeMode>(
            valueListenable: ThemeController.instance.themeModeNotifier,
            builder: (context, mode, _) {
              return SwitchListTile.adaptive(
                title:
                    Text(mode == ThemeMode.dark ? 'Tema escuro' : 'Tema claro'),
                value: mode == ThemeMode.dark,
                onChanged: (value) {
                  Navigator.of(context).pop();
                  ThemeController.instance.toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      items: [
        AppDrawerItem(
          label: context.tr.signUp.login,
          icon: Icons.login,
          onTap: () => loginStep?.call(),
        ),
      ],
      footer: _buildFooter(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppImageNetwork(
                imageUrl: user.profileImageUrl,
                borderRadius: 50,
                width: 32,
                height: 32,
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name.isNotEmpty
                          ? user.name
                          : context.tr.home.visitor,
                      style: AppTypografy.h4Semi,
                    ),
                    Text(
                      user.personalEmail,
                      style: AppTypografy.bodyRegular.copyWith(
                        color: AppColor.neutral.state,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // String _getInitialsName(String name) {
  //   return name.split(' ').map((e) => e.replaceAll('@', '')[0]).join();
  // }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (user.id.isNotEmpty)
            Row(
              children: [
                AppButton.tertiary(
                  label: 'Excluir conta',
                  icon: Icons.delete,
                  onPressed: () => deleteAccount?.call(),
                ),
              ],
            ),
          if (user.id.isNotEmpty)
            Row(
              children: [
                AppButton.tertiary(
                  label: context.tr.app.logout,
                  icon: Icons.logout,
                  onPressed: () {
                    Navigator.of(context).pop();
                    onLogout?.call();
                  },
                ),
              ],
            ),
          if (user.id.isNotEmpty) const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FutureBuilder<PackageInfo>(
              //   future: PackageInfo.fromPlatform(),
              //   builder: (context, snapshot) {
              //     if (!snapshot.hasData) return const SizedBox.shrink();
              //     return Text(
              //       'v${snapshot.data!.version}+${snapshot.data!.buildNumber}',
              //       style: AppTypografy.captionRegular.copyWith(
              //         color: AppColor.neutral.muted,
              //       ),
              //       textAlign: TextAlign.center,
              //     );
              //   },
              // ),
              // TODO: Add version
              Text('v1.0.0'),
            ],
          ),
        ],
      ),
    );
  }
}
