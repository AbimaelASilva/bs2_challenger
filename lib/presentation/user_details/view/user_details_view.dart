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
        title: const Text('Detalhes do Usuário'),
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
                  Text('Erro: ${state.error}'),
                  const SizedBox(height: AppSpacing.xl),
                  PrimaryButton(
                    label: 'Voltar',
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
            );
          }

          if (state.user == null) {
            return const Center(
              child: Text('Usuário não encontrado'),
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
              PrimaryButton(
                label: 'Remover dos Salvos',
                icon: Icons.bookmark_add,
                onPressed: () async {
                  await context.read<UserDetailsViewModel>().toggleSaveUser();
                },
              ),
              PrimaryButton(
                label: 'Salvar',
                icon: Icons.bookmark_add,
                onPressed: () async {},
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
      title: 'Informações Pessoais',
      children: [
        _buildInfoRow(context, 'Gênero', user.gender),
        _buildInfoRow(context, 'Telefone', user.phone),
        _buildInfoRow(context, 'Celular', user.cell),
        _buildInfoRow(context, 'Nacionalidade', user.nat),
      ],
    );
  }

  Widget _buildLocationSection(
    BuildContext context,
    UserEntity user,
  ) {
    return _buildSection(
      context,
      title: 'Localização',
      children: [
        _buildInfoRow(
          context,
          'Endereço',
          '${user.location.street.number} ${user.location.street.name}',
        ),
        _buildInfoRow(context, 'Cidade', user.location.city),
        _buildInfoRow(context, 'Estado', user.location.state),
        _buildInfoRow(context, 'País', user.location.country),
        _buildInfoRow(
          context,
          'CEP',
          user.location.postcode.toString(),
        ),
        _buildInfoRow(
          context,
          'Coordenadas',
          '${user.location.coordinates.latitude}, ${user.location.coordinates.longitude}',
        ),
        _buildInfoRow(
          context,
          'Fuso Horário',
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
      title: 'Login',
      children: [
        _buildInfoRow(context, 'UUID', user.login.uuid),
        _buildInfoRow(context, 'Usuário', user.login.username),
        _buildInfoRow(context, 'Senha', user.login.password),
        _buildInfoRow(context, 'Salt', user.login.salt),
        _buildInfoRow(context, 'MD5', user.login.md5),
        _buildInfoRow(context, 'SHA1', user.login.sha1),
        _buildInfoRow(context, 'SHA256', user.login.sha256),
      ],
    );
  }

  Widget _buildDobSection(
    BuildContext context,
    UserEntity user,
  ) {
    return _buildSection(
      context,
      title: 'Data de Nascimento',
      children: [
        _buildInfoRow(
          context,
          'Data',
          user.dob.date.toFormattedDate,
        ),
        _buildInfoRow(context, 'Idade', '${user.dob.age} anos'),
      ],
    );
  }

  Widget _buildRegisteredSection(
    BuildContext context,
    UserEntity user,
  ) {
    return _buildSection(
      context,
      title: 'Registro',
      children: [
        _buildInfoRow(
          context,
          'Data de Registro',
          user.registered.date.toFormattedDate,
        ),
        _buildInfoRow(
          context,
          'Tempo de Registro',
          '${user.registered.age} anos',
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
      title: 'Identificação',
      children: [
        _buildInfoRow(context, 'Tipo', user.id.name),
        _buildInfoRow(context, 'Valor', user.id.value),
      ],
    );
  }

  Widget _buildPictureSection(
    BuildContext context,
    UserEntity user,
  ) {
    return _buildSection(
      context,
      title: 'Fotos',
      children: [
        _buildInfoRow(context, 'Grande', user.picture.large),
        _buildInfoRow(context, 'Média', user.picture.medium),
        _buildInfoRow(context, 'Miniatura', user.picture.thumbnail),
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
