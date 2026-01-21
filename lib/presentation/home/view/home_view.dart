import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/app_routes.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _searchController.addListener(() {
          final viewModel = context.read<HomeViewModel>();
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
        title: const Text('Bus2 - Usuários'),
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
                      Text('Erro: ${state.error}'),
                      const SizedBox(height: AppSpacing.xl),
                      PrimaryButton(
                        label: 'Tentar novamente',
                        onPressed: () {
                          context.read<HomeViewModel>().getRandonUser();
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
                                await AppNavigation.to(context)
                                    .userDetails(user.login.uuid);

                                context.read<HomeViewModel>().loadLocalUsers();
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  if (state.isLoading)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: AppSpacing.xxxl + AppSizes.bottomNavHeight,
                        ),
                        child: LoadingIndicator(
                          message: 'Buscando mais usuários...',
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
                  title: const Text('Confirmar exclusão'),
                  content: const Text(
                    'Tem certeza que deseja excluir todos os usuários? Esta ação não pode ser desfeita.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.getErrorColor(context),
                      ),
                      child: const Text('Excluir'),
                    ),
                  ],
                ),
              );

              if (confirmed!) {
                await context.read<HomeViewModel>().deleteAllUsers();
              }
            },
            backgroundColor: AppColors.getErrorColor(context),
            child: const Icon(Icons.delete_outline),
          ),
          const SizedBox(height: AppSpacing.sm),
          FloatingActionButton(
            heroTag: 'addUser',
            onPressed: () {
              context.read<HomeViewModel>().getRandonUser();
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
                      hintText: 'Buscar por nome...',
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            _isSearchVisible = false;
                            _searchController.clear();
                            context.read<HomeViewModel>().filterUsers('');
                          });
                        },
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
                    label: 'Buscar',
                    onTap: () {
                      setState(() {
                        _isSearchVisible = true;
                      });
                    },
                  ),
                  BottomNavItem(
                    icon: Icons.storage,
                    label: 'Salvos',
                    onTap: () async {
                      await AppNavigation.to(context).savedUsers();

                      context.read<HomeViewModel>().loadLocalUsers();
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
