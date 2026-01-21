import 'package:flutter/material.dart';

import '../../../theme/theme_data_dark.dart';

/// A generic drawer component that can be used for both user profile and group settings
class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.title,
    required this.items,
    this.header,
    this.footer,
    this.width = 300,
    this.menuIconColor,
    this.backgroundColor,
  });

  /// The title of the drawer
  final String title;

  /// The list of drawer items
  final List<AppDrawerItem> items;

  /// Optional header widget (e.g., user profile info)
  final Widget? header;

  /// Optional footer widget (e.g., logout button)
  final Widget? footer;

  /// The width of the drawer
  final double width;

  /// The color of the menu icon
  final Color? menuIconColor;

  /// The color of the drawer background
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: width,
        backgroundColor: backgroundColor,
        child: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(
              color: menuIconColor ?? AppColor.neutral.white,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              if (header != null) ...[
                header!,
                const Divider(height: 1),
              ],

              // Title section
              Padding(
                padding: const EdgeInsets.all(AppSpacing.xs),
                child: Text(
                  title,
                  style: AppTypografy.h4Semi,
                ),
              ),

              // Items section
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _DrawerItemTile(item: item);
                  },
                ),
              ),

              // Footer section
              if (footer != null) ...[
                const Divider(height: 1),
                footer!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Represents a single item in the drawer
class AppDrawerItem {
  const AppDrawerItem({
    required this.label,
    required this.icon,
    required this.onTap,
    this.selected = false,
    this.badge,
  });

  /// The label text of the item
  final String label;

  /// The icon to display
  final IconData icon;

  /// The callback function when the item is tapped
  final VoidCallback onTap;

  /// Whether this item is currently selected
  final bool selected;

  /// Optional badge to display (e.g., notification count)
  final String? badge;
}

/// The tile widget for each drawer item
class _DrawerItemTile extends StatelessWidget {
  const _DrawerItemTile({
    required this.item,
  });

  final AppDrawerItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: item.selected,
      selectedColor: AppColor.primary.medium,
      selectedTileColor: AppColor.primary.lightest,
      leading: Icon(
        item.icon,
      ),
      title: Text(item.label, style: AppTypografy.bodyRegular),
      trailing: item.badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xxxs,
                vertical: AppSpacing.tetra,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpacing.xxxs),
              ),
              child: Text(
                item.badge!,
                style: AppTypografy.captionRegular.copyWith(),
              ),
            )
          : null,
      onTap: item.onTap,
    );
  }
}
