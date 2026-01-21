import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/enums/app_state_status/app_state_status_enum.dart';

import '../../../data/repositories/repositories.dart';
import '../../../domain/domain.dart';
import '../../core/core.dart';
import '../../core/localization/localization.dart';
import '../../loader.dart';

part 'app_custom_appbar_state.dart';

class AppCustomAppbarCubit extends Cubit<AppCustomAppbarState> {
  AppCustomAppbarCubit({
    required this.authRepository,
  }) : super(AppCustomAppbarState.initial());

  final AuthRepository authRepository;

  Future<void> getInitialData() async {
    final result = await authRepository.getMeLocal;

    result.fold(
      (success) => emit(state.copyWith(user: success)),
      (failure) => emit(state.copyWith(error: failure.toString())),
    );
  }

  // TODO(Abimael): Este login possivelmente vá para um outro cubit
  Future<void> login({
    required void Function() popNavigation,
    required BuildContext context,
  }) async {
    Loader().show();

    final result = await authRepository.login(
      username: state.userName,
      password: state.user.password,
    );

    result.fold(
      (success) {
        emit(state.copyWith(user: success));
        popNavigation.call();
        AppSnackbar().success(context.tr.signUp.successLogin);
      },
      (failure) {
        emit(state.copyWith(error: failure.toString()));
        AppSnackbar().error(context.tr.erros.errorLogin);
      },
    );
    Loader().hide();
  }
}
