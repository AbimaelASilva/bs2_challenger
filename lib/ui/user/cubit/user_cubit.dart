import 'dart:developer';
import 'dart:io';

import 'package:all_validations_br/all_validations_br.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';
import '../../../core/helpers/errors/custom_message.dart';
import '../../../data/data.dart';
import '../../../domain/models/user/user.dart';
import '../../core/components/components.dart';
import '../../core/localization/localization.dart';
import '../../loader.dart';

part 'user_state.dart';

class UserController extends Cubit<UserCreateEditState> {
  UserController({
    required this.userCreateEditRepository,
    required this.authRepository,
    required this.uploadRepository,
  }) : super(UserCreateEditState.initial());

  final UserRepository userCreateEditRepository;
  final AuthRepository authRepository;
  final UploadRepository uploadRepository;

  void setUser(UserModel user) {
    emit(state.copyWith(user: user));
    _validateFields();
  }

  void onChangeName(String value) {
    if (value.isEmpty) {
      emit(
        state.copyWith(
          user: state.user.copyWith(name: value),
          nameError: UIError.requiredField,
        ),
      );
    } else if (value.length < 3) {
      emit(
        state.copyWith(
          user: state.user.copyWith(name: value),
          nameError: UIError.nameIsTooShort,
        ),
      );
    } else {
      emit(
        state.copyWith(
          user: state.user.copyWith(name: value),
          nameError: UIError.empty,
        ),
      );
    }
    _validateFields();
  }

  void onChangePhone(String value) {
    if (value.isEmpty) {
      emit(
        state.copyWith(
          user: state.user.copyWith(phone: value),
          phoneError: UIError.requiredField,
        ),
      );
    } else if (value.length < 15) {
      emit(
        state.copyWith(
          user: state.user.copyWith(phone: value),
          phoneError: UIError.nameIsTooShort,
        ),
      );
    } else {
      emit(
        state.copyWith(
          user: state.user.copyWith(phone: value),
          phoneError: UIError.empty,
        ),
      );
    }
    _validateFields();
  }

  void onChangeEmail(String value) {
    if (value.isEmpty || AllValidations.isEmail(value)) {
      emit(
        state.copyWith(
          user: state.user.copyWith(personalEmail: value),
          emailError: UIError.empty,
        ),
      );
    } else {
      emit(
        state.copyWith(
          user: state.user.copyWith(personalEmail: value),
          emailError: UIError.invalidDate,
        ),
      );
    }
  }

  void onChangeBirtDate(String value) {
    final RegExp dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');

    if (value.isEmpty) {
      emit(
        state.copyWith(
          user: state.user.copyWith(),
          birthDateErrorStream: UIError.requiredField,
        ),
      );
    } else if (!dateRegex.hasMatch(value)) {
      // Formato incorreto
      emit(
        state.copyWith(
          user: state.user.copyWith(),
          birthDateErrorStream: UIError.invalidDate,
        ),
      );
    } else {
      try {
        final DateFormat inputFormat = DateFormat('dd/MM/yyyy');
        final DateTime selectedDate =
            inputFormat.parseStrict(value); // <-- usa parseStrict
        final DateTime now = DateTime.now();
        final DateTime limitDate = DateTime(now.year + 10, now.month, now.day);

        if (selectedDate.isAfter(limitDate)) {
          emit(
            state.copyWith(
              user: state.user.copyWith(),
              birthDateErrorStream: UIError.invalidDate,
            ),
          );
        } else {
          emit(
            state.copyWith(
              user: state.user.copyWith(birthDate: selectedDate),
              birthDateErrorStream: UIError.empty,
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            user: state.user.copyWith(),
            birthDateErrorStream: UIError.invalidDate,
          ),
        );
      }
    }

    // _validateFields();
  }

  void onChangeGender(UserGenderEnum? value) {
    emit(
      state.copyWith(
        user: state.user.copyWith(gender: value),
      ),
    );

    _validateFields();
  }

  void onChangePassword(String value) {
    if (value.isEmpty) {
      emit(
        state.copyWith(
          user: state.user.copyWith(password: value),
          passwordErrorStream: UIError.requiredField,
        ),
      );
    } else if (value.length < 6) {
      emit(
        state.copyWith(
          user: state.user.copyWith(password: value),
          passwordErrorStream: UIError.nameIsTooShort,
        ),
      );
    } else {
      emit(
        state.copyWith(
          user: state.user.copyWith(password: value),
          passwordErrorStream: UIError.empty,
        ),
      );
    }
    _validateFields();
  }

  void onChangeConfirmPassword(String value) {
    if (state.user.confirmPassword.isNotEmpty) {
      emit(
        state.copyWith(
          confirmPasswordErrorStream: UIError.passwordsAreDifferent,
          confirmPassword: value,
          user: state.user.copyWith(confirmPassword: value),
        ),
      );
    } else {
      emit(
        state.copyWith(
          confirmPasswordErrorStream: UIError.empty,
          confirmPassword: value,
          user: state.user.copyWith(confirmPassword: value),
        ),
      );
    }
    _validateFields();
  }

  void _validateFields() {
    final bool isNameValid =
        state.nameErrorStream == UIError.empty && state.user.name.isNotEmpty;

    final bool isPasswordValid = state.passwordErrorStream == UIError.empty &&
        state.user.password.isNotEmpty;

    final bool isConfirmPasswordValid =
        state.user.password == state.confirmPassword;

    // final bool isBirthDateValid = state.birthDateErrorStream == UIError.empty &&
    //     state.user.birthDate != null;

    final bool isPhoneValid =
        state.phoneErrorStream == UIError.empty && state.user.phone.isNotEmpty;

    final bool isAllFieldsValidates = isNameValid &&
        isPasswordValid &&
        isConfirmPasswordValid &&
        //   isBirthDateValid &&
        isPhoneValid &&
        state.acceptedTerms;

    final bool isEditAndAllFieldsValidates = state.user.id.isNotEmpty &&
        isNameValid &&
        //   isBirthDateValid &&
        isPhoneValid;

    emit(
      state.copyWith(
        isAllFieldsValidates:
            isEditAndAllFieldsValidates || isAllFieldsValidates,
      ),
    );
  }

  void onChangeAcceptedTerms(bool? value) {
    if (value == null) return;
    emit(state.copyWith(acceptedTerms: value));
    _validateFields();
  }

  Future<void> saveUser({
    required void Function() pop,
    required BuildContext context,
  }) async {
    try {
      Loader().show();

      final auxUser = state.user.copyWith(
        email:
            "${state.user.phone.cleanPhoneNumberWithCountryCode.trim()}@base-code.com",
      );

      log("USUÁRIO A CRIAR: ${auxUser.toSave()}");

      final credentials = await userCreateEditRepository.saveUser(auxUser);
      await credentials.fold(
        (createdUser) async {
          log("USUÁRIO CRIADO: ${createdUser.toMap()}");
          if (state.user.id.isEmpty) {
            await authRepository.login(
              username: auxUser.email,
              password: state.user.password,
            );
          }

          await authRepository.saveLocalUser(user: createdUser);

          pop.call();
          AppSnackbar().success(
            state.user.id.isEmpty
                ? context.tr.signUp.successRegisterUser
                : context.tr.signUp.successUpdatedYourDatas,
          );
        },
        (failure) {
          customMessageError(
            messageDefault: state.user.id.isEmpty
                ? context.tr.erros.errorRegisterUser
                : context.tr.erros.errorUpdateData,
            failure: failure,
          );
        },
      );
    } catch (e, s) {
      log("FALHA AO CRIAR USUÁRIO: $e", error: e, stackTrace: s);
      AppSnackbar().error(
        state.user.id.isEmpty
            ? context.tr.erros.errorRegisterUser
            : context.tr.erros.errorUpdateData,
      );
    } finally {
      Loader().hide();
    }
  }

  Future<void> uploadFile(File file, String fileName) async {
    final result = await uploadRepository.upload(
      file: file,
      fileName: fileName,
    );

    result.fold(
      (file) => AppSnackbar().success(
        "Arquivo enviado com sucesso",
      ),
      (failure) => AppSnackbar().error(
        "Erro ao enviar arquivo",
      ),
    );
  }

  Future<void> onPressedGetProfileImageUrl() async {
    try {
      Loader().show();
      final image = await AppImagePicker().pickImage();

      // if (image != null) {
      //   final file = File(image.path);

      //   final imageName =
      //       '${state.user.name.replaceAll(' ', '_').toLowerCase()}_${state.user.id}profileImageUrl${generateUniqueId()}.png';

      //   await uploadFile(file, imageName);

      //   emit(
      //     state.copyWith(
      //       user: state.user.copyWith(
      //         profileImageUrl: '${EnvironmentConfig.baseUrlImage}/$imageName',
      //       ),
      //     ),
      //   );

      //   await userCreateEditRepository.updateUserProfileImageUrl(
      //     userId: state.user.id,
      //     profileImageUrl: '${EnvironmentConfig.baseUrlImage}/$imageName',
      //   );
      // }
    } catch (e) {
      AppSnackbar().error(
        "Erro ao selecionar arquivo",
      );
    } finally {
      Loader().hide();
    }
  }
}
