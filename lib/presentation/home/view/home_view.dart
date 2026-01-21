import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared.dart';

import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(context),
      appBar: AppBar(
        title: const Text('Usuários'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.getBackgroundColor(context).withValues(alpha: 0.8),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: AppSpacing.sm),
          child: IconButtonCustom(
            icon: Icons.search,
            onPressed: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: IconButtonCustom(
              icon: Icons.storage,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          BlocBuilder<HomeViewModel, HomeViewModelState>(
            builder: (context, state) {
              if (state.isLoading && state.users.isEmpty) {
                return const Center(
                  child: LoadingIndicator(),
                );
              }

              if (state.error != null && state.users.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${state.error}'),
                      const SizedBox(height: AppSpacing.xl),
                      PrimaryButton(
                        label: 'Retry',
                        onPressed: () {
                          context.read<HomeViewModel>().loadUsers();
                        },
                      ),
                    ],
                  ),
                );
              }

              return CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      top: AppSpacing.xl,
                      left: AppSpacing.xl,
                      right: AppSpacing.xl,
                      bottom: AppSpacing.xxxl + AppSizes.bottomNavHeight,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.getCardColor(context),
                          borderRadius:
                              BorderRadius.circular(AppSizes.borderRadiusXl),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            for (int i = 0; i < state.users.length; i++)
                              UserListTile(
                                name: state.users[i].name,
                                location: state.users[i].location,
                                avatarUrl: state.users[i].avatarUrl,
                                showDivider: i < state.users.length - 1,
                                onTap: () {},
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state.isLoadingMore)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: AppSpacing.xxxl + AppSizes.bottomNavHeight,
                        ),
                        child: LoadingIndicator(
                          message: 'Fetching more profiles...',
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          Positioned(
            bottom: AppSizes.bottomNavHeight + AppSpacing.xl,
            left: 0,
            right: 0,
            child: Center(
              child: PrimaryButton(
                icon: Icons.refresh,
                label: 'Refresh List',
                onPressed: () {
                  context.read<HomeViewModel>().refreshUsers();
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: AppSizes.bottomNavHeight,
        decoration: BoxDecoration(
          color: AppColors.getCardColor(context).withValues(alpha: 0.95),
          border: Border(
            top: BorderSide(
              color: AppColors.getBorderColor(context),
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          left: AppSpacing.xxl,
          right: AppSpacing.xxl,
          top: AppSpacing.md,
          bottom: AppSpacing.xxl,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              icon: Icons.person_search,
              label: 'Discovery',
              isSelected: true,
              onTap: () {},
            ),
            BottomNavItem(
              icon: Icons.bookmarks,
              label: 'Saved',
              onTap: () {},
            ),
            BottomNavItem(
              icon: Icons.history,
              label: 'History',
              onTap: () {},
            ),
            BottomNavItem(
              icon: Icons.settings,
              label: 'Settings',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
