import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/helper/helper.dart';
import '../../../domain/domain.dart';
import '../../shared/shared.dart';
import '../viewmodel/user_details_viewmodel.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(context),
      appBar: AppBar(
        title: Text(context.l10n.userDetails),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.getBackgroundColor(context).withValues(alpha: 0.8),
          ),
        ),
      ),
      body: BlocBuilder<UserDetailsViewModel, UserDetailsViewModelState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: LoadingIndicator(),
            );
          }

          if (state.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${context.l10n.error}: ${state.error}'),
                  const SizedBox(height: AppSpacing.xl),
                  PrimaryButton(
                    label: context.l10n.back,
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
            );
          }

          if (state.user == null) {
            return Center(
              child: Text(context.l10n.userNotFound),
            );
          }

          final user = state.user!;

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildHeader(
                      context,
                      user,
                      state,
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    _buildPersonalInfoSection(context, user),
                    const SizedBox(height: AppSpacing.xl),
                    _buildLocationSection(context, user),
                    const SizedBox(height: AppSpacing.xl),
                    _buildLoginSection(context, user),
                    const SizedBox(height: AppSpacing.xl),
                    _buildDobSection(context, user),
                    const SizedBox(height: AppSpacing.xl),
                    _buildRegisteredSection(context, user),
                    const SizedBox(height: AppSpacing.xl),
                    _buildIdSection(context, user),
                    const SizedBox(height: AppSpacing.xl),
                    _buildPictureSection(context, user),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    UserEntity user,
    UserDetailsViewModelState state,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.getCardColor(context),
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusXl),
        boxShadow: [
          BoxShadow(
            color: AppColors.getShadowColor(context),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusFull),
            child: Image.network(
              user.picture.large,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.getSlate300(context),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, size: 60),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            '${user.name.title} ${user.name.first} ${user.name.last}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            user.email,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.getSlate500(context),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xxl),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  label: context.l10n.remove,
                  icon: Icons.bookmark_remove,
                  onPressed: () async {
                    await context.read<UserDetailsViewModel>().toggleSaveUser();
                    context.pop();
                    if (context.mounted) {
                      CustomSnackBar.show(
                        context,
                        message: context.l10n.userRemovedSuccess,
                        type: SnackBarType.success,
                      );
                    }
                  },
                ),
              ),
              const SizedBox(width: AppSpacing.xl),
              Expanded(
                child: PrimaryButton(
                  label: context.l10n.save,
                  icon: Icons.bookmark_add,
                  onPressed: () async {
                    if (state.isSaved) {
                      CustomSnackBar.show(
                        context,
                        message: context.l10n.userAlreadySaved,
                      );
                      return;
                    }

                    await context.read<UserDetailsViewModel>().toggleSaveUser();
                    if (context.mounted) {
                      CustomSnackBar.show(
                        context,
                        message: context.l10n.userSavedSuccess,
                        type: SnackBarType.success,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoSection(
    BuildContext context,
    UserEntity user,
  ) {
    return _buildSection(
      context,
      title: context.l10n.personalInfo,
      children: [
        _buildInfoRow(context, context.l10n.gender, user.gender),
        _buildInfoRow(context, context.l10n.phone, user.phone),
        _buildInfoRow(context, context.l10n.cell, user.cell),
        _buildInfoRow(context, context.l10n.nationality, user.nat),
      ],
    );
  }

  Widget _buildLocationSection(
    BuildContext context,
    UserEntity user,
  ) {
    return _buildSection(
      context,
      title: context.l10n.location,
      children: [
        _buildInfoRow(
          context,
          context.l10n.address,
          '${user.location.street.number} ${user.location.street.name}',
        ),
        _buildInfoRow(context, context.l10n.city, user.location.city),
        _buildInfoRow(context, context.l10n.state, user.location.state),
        _buildInfoRow(context, context.l10n.country, user.location.country),
        _buildInfoRow(
          context,
          context.l10n.postcode,
          user.location.postcode.toString(),
        ),
        _buildInfoRow(
          context,
          context.l10n.coordinates,
          '${user.location.coordinates.latitude}, ${user.location.coordinates.longitude}',
        ),
        _buildInfoRow(
          context,
          context.l10n.timezone,
          '${user.location.timezone.offset} - ${user.location.timezone.description}',
        ),
      ],
    );
  }

  Widget _buildLoginSection(
    BuildContext context,
    UserEntity user,
  ) {
    return _buildSection(
      context,
      title: context.l10n.login,
      children: [
        _buildInfoRow(context, context.l10n.uuid, user.login.uuid),
        _buildInfoRow(context, context.l10n.username, user.login.username),
        _buildInfoRow(context, context.l10n.password, user.login.password),
        _buildInfoRow(context, context.l10n.salt, user.login.salt),
        _buildInfoRow(context, context.l10n.md5, user.login.md5),
        _buildInfoRow(context, context.l10n.sha1, user.login.sha1),
        _buildInfoRow(context, context.l10n.sha256, user.login.sha256),
      ],
    );
  }

  Widget _buildDobSection(
    BuildContext context,
    UserEntity user,
  ) {
    return _buildSection(
      context,
      title: context.l10n.dateOfBirth,
      children: [
        _buildInfoRow(
          context,
          context.l10n.date,
          user.dob.date.toFormattedDate,
        ),
        _buildInfoRow(context, context.l10n.age, '${user.dob.age} ${context.l10n.years(user.dob.age)}'),
      ],
    );
  }

  Widget _buildRegisteredSection(
    BuildContext context,
    UserEntity user,
  ) {
    return _buildSection(
      context,
      title: context.l10n.registered,
      children: [
        _buildInfoRow(
          context,
          context.l10n.registrationDate,
          user.registered.date.toFormattedDate,
        ),
        _buildInfoRow(
          context,
          context.l10n.registrationTime,
          '${user.registered.age} ${context.l10n.years(user.registered.age)}',
        ),
      ],
    );
  }

  Widget _buildIdSection(
    BuildContext context,
    UserEntity user,
  ) {
    return _buildSection(
      context,
      title: context.l10n.identification,
      children: [
        _buildInfoRow(context, context.l10n.type, user.id.name),
        _buildInfoRow(context, context.l10n.value, user.id.value),
      ],
    );
  }

  Widget _buildPictureSection(
    BuildContext context,
    UserEntity user,
  ) {
    return _buildSection(
      context,
      title: context.l10n.pictures,
      children: [
        _buildInfoRow(context, context.l10n.large, user.picture.large),
        _buildInfoRow(context, context.l10n.medium, user.picture.medium),
        _buildInfoRow(context, context.l10n.thumbnail, user.picture.thumbnail),
      ],
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.getCardColor(context),
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusXl),
        boxShadow: [
          BoxShadow(
            color: AppColors.getShadowColor(context),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.getSlate500(context),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? '-' : value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
