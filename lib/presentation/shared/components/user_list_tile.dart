import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.name,
    required this.location,
    required this.avatarUrl,
    this.onTap,
    this.showDivider = true,
  });

  final String name;
  final String location;
  final String avatarUrl;
  final VoidCallback? onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(AppSpacing.listItemPadding),
          decoration: BoxDecoration(
            border: showDivider
                ? Border(
                    bottom: BorderSide(
                      color: AppColors.getBorderColor(context),
                      width: 1,
                    ),
                  )
                : null,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusFull),
                child: Image.network(
                  avatarUrl,
                  width: AppSizes.avatarSize,
                  height: AppSizes.avatarSize,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: AppSizes.avatarSize,
                      height: AppSizes.avatarSize,
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.slate800
                            : AppColors.slate100,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: AppSpacing.listItemGap),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.getSlate500(context),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: AppSizes.iconSizeSmall,
                color: AppColors.getSlate300(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
