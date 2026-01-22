import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/routing/routing.dart';
import '../../shared/shared.dart';
import '../viewmodel/saved_viewmodel.dart';

class SavedUserView extends StatelessWidget {
  const SavedUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SavedViewModel>(
      create: (context) => GetIt.I<SavedViewModel>(),
      child: Scaffold(
        backgroundColor: AppColors.getBackgroundColor(context),
        appBar: AppBar(
          title: const Text('Usuários Salvos'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color:
                  AppColors.getBackgroundColor(context).withValues(alpha: 0.8),
            ),
          ),
        ),
        body: BlocBuilder<SavedViewModel, SavedViewModelState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: LoadingIndicator(),
              );
            }

            if (state.error != null && state.users.isEmpty) {
              return Center(
                child: Text('Erro: ${state.error}'),
              );
            }

            if (state.users.isEmpty) {
              return const Center(
                child: Text('Nenhum usuário salvo'),
              );
            }

            return CustomScrollView(
              slivers: [
                if (state.users.isNotEmpty)
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
                          _getUsersFoundCountText(state.users.length),
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
                    bottom: AppSpacing.xl,
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
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          final user = state.users[index];
                          return UserListTile(
                            name: '${user.name.first} ${user.name.last}'.trim(),
                            location:
                                '${user.location.city}, ${user.location.state}, ${user.location.country}',
                            avatarUrl: user.picture.large,
                            showDivider: index < state.users.length - 1,
                            onTap: () async {
                              await AppNavigation.to(context)
                                  .userDetails(user.login.uuid);
                              if (context.mounted) {
                                await context
                                    .read<SavedViewModel>()
                                    .loadSavedUsers();
                              }
                            },
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                color: AppColors.getErrorColor(context),
                              ),
                              onPressed: () async {
                                final confirmed = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Remover usuário'),
                                    content: const Text(
                                      'Tem certeza que deseja remover este usuário dos salvos?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        style: TextButton.styleFrom(
                                          foregroundColor:
                                              AppColors.getErrorColor(context),
                                        ),
                                        child: const Text('Remover'),
                                      ),
                                    ],
                                  ),
                                );

                                if (confirmed! && context.mounted) {
                                  await context
                                      .read<SavedViewModel>()
                                      .deleteUser(user.login.uuid);
                                  if (context.mounted) {
                                    CustomSnackBar.show(
                                      context,
                                      message: 'Usuário removido com sucesso!',
                                      type: SnackBarType.success,
                                    );
                                  }
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _getUsersFoundCountText(int count) {
    if (count == 1) {
      return '1 usuário salvo localmente';
    }
    return '$count usuários salvos localmente';
  }
}
