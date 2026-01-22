import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/helper.dart';
import '../../../core/routing/routing.dart';
import '../../shared/shared.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchVisible = false;

  late final HomeViewModel viewModel;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel = context.read<HomeViewModel>();
      if (mounted) {
        _searchController.addListener(() {
          viewModel.filterUsers(_searchController.text);
        });
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(context),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(context.l10n.appTitle),
        actions: const [
          LanguageSelector(),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.getBackgroundColor(context).withValues(alpha: 0.8),
          ),
        ),
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
                      Text('${context.l10n.error}: ${state.error}'),
                      const SizedBox(height: AppSpacing.xl),
                      PrimaryButton(
                        label: context.l10n.tryAgain,
                        onPressed: () {
                          viewModel.getRandonUser();
                        },
                      ),
                    ],
                  ),
                );
              }

              final displayUsers =
                  state.searchQuery.isEmpty ? state.users : state.filteredUsers;

              return CustomScrollView(
                slivers: [
                  if (displayUsers.isNotEmpty)
                    SliverPadding(
                      padding: const EdgeInsets.only(
                        top: AppSpacing.xl,
                        left: AppSpacing.xl,
                        right: AppSpacing.xl,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            context.l10n.usersFound(displayUsers.length),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.getSlate500(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      top: AppSpacing.md,
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
                              color: AppColors.getShadowColor(context),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: displayUsers.length,
                          itemBuilder: (context, index) {
                            final user = displayUsers[index];
                            return UserListTile(
                              name:
                                  '${user.name.first} ${user.name.last}'.trim(),
                              location:
                                  '${user.location.city}, ${user.location.state}, ${user.location.country}',
                              avatarUrl: user.picture.large,
                              showDivider: index < displayUsers.length - 1,
                              onTap: () async {
                                _closeSearch();
                                await AppNavigation.to(context)
                                    .userDetails(user.login.uuid);

                                await context
                                    .read<HomeViewModel>()
                                    .loadLocalUsers();
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  if (state.isLoading)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppSpacing.xxxl + AppSizes.bottomNavHeight,
                        ),
                        child: LoadingIndicator(
                          message: context.l10n.fetchingMoreUsers,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'deleteAll',
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(context.l10n.confirmDelete),
                  content: Text(context.l10n.confirmDeleteAllMessage),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(context.l10n.cancel),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.getErrorColor(context),
                      ),
                      child: Text(context.l10n.delete),
                    ),
                  ],
                ),
              );

              if (confirmed == true) {
                await viewModel.deleteAllUsers();
              }
            },
            backgroundColor: AppColors.getErrorColor(context),
            child: const Icon(Icons.delete_outline),
          ),
          const SizedBox(height: AppSpacing.sm),
          FloatingActionButton(
            heroTag: 'addUser',
            onPressed: () {
              viewModel.getRandonUser();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      bottomNavigationBar: _isSearchVisible
          ? Container(
              height: AppSizes.bottomNavHeight,
              decoration: BoxDecoration(
                color: AppColors.getCardColor(context).withValues(alpha: 0.95),
                border: Border(
                  top: BorderSide(
                    color: AppColors.getBorderColor(context),
                  ),
                ),
              ),
              padding: const EdgeInsets.all(
                AppSpacing.xl,
              ),
              child: ValueListenableBuilder<TextEditingValue>(
                valueListenable: _searchController,
                builder: (context, value, child) {
                  return TextField(
                    controller: _searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: context.l10n.searchPlaceholder,
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: _closeSearch,
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(
              height: AppSizes.bottomNavHeight,
              decoration: BoxDecoration(
                color: AppColors.getCardColor(context).withValues(alpha: 0.95),
                border: Border(
                  top: BorderSide(
                    color: AppColors.getBorderColor(context),
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
                    icon: Icons.search,
                    label: context.l10n.search,
                    onTap: () {
                      setState(() {
                        _isSearchVisible = true;
                      });
                    },
                  ),
                  BottomNavItem(
                    icon: Icons.storage,
                    label: context.l10n.saved,
                    onTap: () async {
                      _closeSearch();
                      await AppNavigation.to(context).savedUsers();

                      await viewModel.loadLocalUsers();
                    },
                  ),
                ],
              ),
            ),
    );
  }

  void _closeSearch() {
    setState(() {
      _isSearchVisible = false;
      _searchController.clear();
      viewModel.filterUsers('');
    });
  }
}
