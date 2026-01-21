import 'package:bloc/bloc.dart';

import '../../../domain/domain.dart';

part 'user_details_viewmodel_state.dart';

class UserDetailsViewModel extends Cubit<UserDetailsViewModelState> {
  UserDetailsViewModel({
    required this.userRepository,
    required this.userId,
  }) : super(const UserDetailsViewModelState()) {
    _loadUser();
  }

  final IUserRepository userRepository;
  final String userId;

  Future<void> _loadUser() async {
    if (isClosed) return;

    try {
      emit(state.copyWith(isLoading: true));

      final user = await userRepository.getUser(userId);
      final isSaved = await _checkIfUserIsSaved(userId);

      if (!isClosed) {
        emit(
          state.copyWith(
            user: user,
            isLoading: false,
            isSaved: isSaved,
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            isLoading: false,
            error: e.toString(),
          ),
        );
      }
    }
  }

  Future<bool> _checkIfUserIsSaved(String id) async {
    try {
      final localUsers = await userRepository.getLocalUsers();
      return localUsers.any((user) => user.login.uuid == id);
    } catch (e) {
      return false;
    }
  }

  Future<void> toggleSaveUser() async {
    if (isClosed || state.user == null) return;

    try {
      if (state.isSaved) {
        await userRepository.deleteUser(state.user!.login.uuid);
        if (!isClosed) {
          emit(state.copyWith(isSaved: false));
        }
      } else {
        await userRepository.createUser(state.user!);
        if (!isClosed) {
          emit(state.copyWith(isSaved: true));
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(error: e.toString()));
      }
    }
  }
}
