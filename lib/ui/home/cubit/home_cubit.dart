
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../core/helpers/errors/custom_message.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../core/core.dart';
import '../../core/localization/localization.dart';
import '../../loader.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController({
    required this.authRepository,
    required this.storageService,
    required this.genericRepository,
  }) : super(HomeState.initial());

  final AuthRepository authRepository;
  final StorageService storageService;

  final GenericRepository genericRepository;

  static const String _themeKey = 'app_theme';

  Future<void> toggleTheme() async {
    final currentTheme = storageService.fetchString(_themeKey);
    final newTheme = currentTheme.fold(
      (success) => success == 'dark' ? 'light' : 'dark',
      (failure) => 'light',
    );
    await storageService.saveString(_themeKey, newTheme);
    emit(
      state.copyWith(
        themeMode: newTheme == 'dark' ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }

  Future<void> loadSavedTheme() async {
    final savedTheme = storageService.fetchString(_themeKey);
    savedTheme.fold(
      (success) => emit(
        state.copyWith(
          themeMode: success == 'dark' ? ThemeMode.dark : ThemeMode.light,
        ),
      ),
      (failure) => null,
    );
  }

  void setUserName(String userName) {
    emit(state.copyWith(userName: userName.toUpperCase().trim()));
  }

  void setPassword(String password) {
    emit(state.copyWith(user: state.user.copyWith(password: password)));
  }

  void setPasswordRecoveryPhone(String phone) {
    emit(state.copyWith(passwordRecoveryPhone: phone));
  }

  void setPasswordRecoverySmsCode(String code) {
    emit(state.copyWith(passwordRecoverySmsCode: code));
  }

  void setPasswordRecoveryNewPassword(String password) {
    emit(state.copyWith(passwordRecoveryNewPassword: password));
  }

  void setPasswordRecoveryConfirmPassword(String password) {
    emit(state.copyWith(passwordRecoveryConfirmPassword: password));
  }

  void setPasswordRecoveryStep(int step) {
    emit(state.copyWith(passwordRecoveryStep: step));
  }

  Future<void> getInitialData() async {
    await Future.wait([
      getMeLocal(),
    ]);
  }

  Future<void> getMeLocal() async {
    final result = await authRepository.getMeLocal;

    result.fold(
      (success) => emit(state.copyWith(user: success)),
      (failure) => emit(state.copyWith(error: failure.toString())),
    );
  }

  Future<void> getMe() async {
    final result = await authRepository.getMe(id: state.user.id);

    result.fold(
      (success) => emit(state.copyWith(user: success)),
      (failure) => emit(state.copyWith(error: failure.toString())),
    );
  }

  Future<void> login({
    required void Function() popNavigation,
    required BuildContext context,
  }) async {
    try {
      Loader().show();

      final username =
          '${state.userName.cleanPhoneNumberWithCountryCode.toLowerCase().trim()}@base-code.com';

      final result = await authRepository.login(
        username: username,
        password: state.user.password,
      );

      await result.fold(
        (success) async {
          final user = await authRepository.getMe(id: success.id);
          await authRepository.saveLocalUser(user: success);

          user.fold(
            (success) => emit(state.copyWith(user: success)),
            (failure) => emit(state.copyWith(error: failure.toString())),
          );

          popNavigation.call();

          AppSnackbar().success(context.tr.signUp.successLogin);
        },
        (failure) {
          customMessageError(
            messageDefault: context.tr.erros.errorLogin,
            failure: failure,
          );
        },
      );
    } catch (e) {
      Loader().hide();
      emit(state.copyWith(error: e.toString()));
      AppSnackbar().error(context.tr.erros.errorLogin);
    } finally {
      Loader().hide();
    }
  }

  Future<void> logOut() async {
    try {
      await authRepository.logout();
      emit(state.copyWith(user: UserModel.empty()));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
