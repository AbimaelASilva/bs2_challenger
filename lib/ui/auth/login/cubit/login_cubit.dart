import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../../../../core/enums/app_state_status/app_state_status_enum.dart';
import '../../../../data/repositories/repositories.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repository}) : super(const LoginState.initial());

  final AuthRepository repository;

  Future<void> login(String username, String password) async {
    emit(state.copyWith(status: AppStateStatus.loading));
    final result =
        await repository.login(username: username, password: password);

    result.fold(
      (success) => emit(state.copyWith(status: AppStateStatus.success)),
      (failure) => emit(
        state.copyWith(
          status: AppStateStatus.failure,
          error: failure.toString(),
        ),
      ),
    );
  }
}
