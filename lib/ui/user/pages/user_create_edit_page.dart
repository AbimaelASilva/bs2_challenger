import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../core/core.dart';
import '../../core/localization/localization.dart';
import '../../ui.dart';

class UserPage extends StatelessWidget {
  UserPage({
    super.key,
    required this.cubit,
    required this.user,
  }) {
    cubit.setUser(user);
  }

  final UserController cubit;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<UserController, UserCreateEditState>(
        buildWhen: (previous, current) =>
            previous.user.profileImageUrl != current.user.profileImageUrl,
        builder: (context, state) {
          return AppScaffoldCreateEdit(
            title: context.tr.signUp.bePart,
            showProfileImage: cubit.state.user.id.isNotEmpty,
            urlBackgroundImage: state.user.profileImageUrl ??
                'https://images.vexels.com/media/users/3/132209/isolated/preview/a00fc18d8cd573976f1096054905655b-icone-de-circulo-do-jogador-de-futebol.png?w=360',
            onPressedEditImage: cubit.onPressedGetProfileImageUrl,
            bodyForm: Column(
              children: [
                BlocBuilder<UserController, UserCreateEditState>(
                  buildWhen: (previous, current) =>
                      previous.nameError != current.nameError,
                  builder: (context, state) {
                    return AppInput.general(
                      initialValue: cubit.state.user.name,
                      error: cubit.state.nameErrorStream.description(context),
                      labelAbove: '${context.tr.signUp.name} *',
                      onChanged: cubit.onChangeName,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: BlocBuilder<UserController, UserCreateEditState>(
                    buildWhen: (previous, current) =>
                        previous.phoneError != current.phoneError,
                    builder: (context, state) {
                      return AppInput.general(
                        initialValue:
                            cubit.state.user.phone.replaceAll("55", ""),
                        error: cubit.state.phoneError.description(context),
                        labelAbove: '${context.tr.signUp.phone} *',
                        mask: AppMasked(mask: "(00) 00000-0000"),
                        hint: "Ex: (99) 99999-9999",
                        inputType: TextInputType.phone,
                        onChanged: cubit.onChangePhone,
                        //   showMandatorySign: true,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 8),
                  child: AppRowInfo(
                    text: context.tr.signUp.phoneRecoveryInfoMessage,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: BlocBuilder<UserController, UserCreateEditState>(
                    buildWhen: (previous, current) =>
                        previous.emailError != current.emailError,
                    builder: (context, state) {
                      return AppInput.email(
                        initialValue: cubit.state.user.personalEmail,
                        error: cubit.state.emailError.description(context),
                        labelAbove: context.tr.app.email,
                        hint: "base-code@base-code.com",
                        label: '',
                        onChanged: cubit.onChangeEmail,
                      );
                    },
                  ),
                ),
                BlocBuilder<UserController, UserCreateEditState>(
                  buildWhen: (previous, current) =>
                      previous.birthDateErrorStream !=
                          current.birthDateErrorStream &&
                      previous.user.birthDate != current.user.birthDate,
                  builder: (context, sate) {
                    return AppInput.general(
                      initialValue: cubit.state.user.birthDate?.toDDMMYYYY,
                      // error:                          cubit.state.birthDateErrorStream.description(context),

                      labelAbove: context.tr.signUp.birthdate,
                      //  label: "Ex: 05/05/1999",
                      mask: AppMasked(mask: "00/00/0000"),
                      inputType: TextInputType.phone,
                      onChanged: cubit.onChangeBirtDate,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: AppDropdown(
                    value: cubit.state.user.gender,

                    items: UserGenderEnum.values
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.label(context)),
                          ),
                        )
                        .toList(),
                    enabled: true,
                    labelAbove: context.tr.signUp.gender,
                    //  sufixIcon: const Icon(Icons.male),
                    onChanged: cubit.onChangeGender,
                  ),
                ),
                if (cubit.state.user.id.isEmpty)
                  BlocBuilder<UserController, UserCreateEditState>(
                    buildWhen: (previous, current) =>
                        previous.passwordError != current.passwordError,
                    builder: (context, state) {
                      return AppInput.password(
                        error: cubit.state.passwordErrorStream
                            .description(context),
                        labelAbove: '${context.tr.app.password} *',
                        label: "",
                        onChanged: cubit.onChangePassword,
                      );
                    },
                  ),
                if (cubit.state.user.id.isEmpty)
                  BlocBuilder<UserController, UserCreateEditState>(
                    buildWhen: (previous, current) =>
                        previous.confirmPasswordError !=
                        current.confirmPasswordError,
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: AppInput.password(
                          error: cubit.state.confirmPasswordErrorStream
                              .description(context),
                          labelAbove: '${context.tr.signUp.confirmPassword} *',
                          label: "",
                          onChanged: cubit.onChangeConfirmPassword,
                        ),
                      );
                    },
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: BlocBuilder<UserController, UserCreateEditState>(
                    buildWhen: (previous, current) =>
                        previous.acceptedTerms != current.acceptedTerms,
                    builder: (context, state) {
                      return Row(
                        children: [
                          Checkbox(
                            value: state.acceptedTerms,
                            onChanged: cubit.onChangeAcceptedTerms,
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text:
                                    'Ao continuar com o cadastro, você concorda com os ',
                                children: [
                                  TextSpan(
                                    text: 'Termos de Uso(EULA)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          decoration: TextDecoration.underline,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final url = Uri.parse(
                                          AppUrls.eula,
                                        );
                                        // if (await canLaunchUrl(url)) {
                                        //   await launchUrl(url);
                                        // }
                                      },
                                  ),
                                ],
                              ),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar:
                BlocBuilder<UserController, UserCreateEditState>(
              buildWhen: (previous, current) =>
                  previous.isAllFieldsValidates != current.isAllFieldsValidates,
              builder: (context, state) {
                return AppButton.primary(
                  label: context.tr.app.register,
                  // onPressed: () => cubit.saveUser(
                  //   pop: () => Navigator.of(context).pop(),
                  //   context: context,
                  // ),
                  onPressed: state.isAllFieldsValidates
                      ? () => cubit.saveUser(
                            pop: () => Navigator.of(context).pop(),
                            context: context,
                          )
                      : null,
                  // onPressed: cubit.registerUser,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
