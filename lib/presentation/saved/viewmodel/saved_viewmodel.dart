import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../domain/domain.dart';

part 'saved_viewmodel_state.dart';

class SavedViewModel extends Cubit<SavedViewModelState> {
  SavedViewModel({required this.userRepository})
      : super(const SavedViewModelState()) {
    loadSavedUsers();
    _startPeriodicRefresh();
  }

  final IUserRepository userRepository;
  Timer? _refreshTimer;

  void _startPeriodicRefresh() {
    _refreshTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      loadSavedUsers(showLoading: false);
    });
  }

  Future<void> loadSavedUsers({bool showLoading = true}) async {
    if (isClosed) return;

    try {
      if (showLoading) {
        emit(state.copyWith(isLoading: true));
      }

      final users = await userRepository.getLocalUsers();

      if (!isClosed) {
        emit(state.copyWith(users: users, isLoading: false));
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    }
  }

  Future<void> deleteUser(String uuid) async {
    if (isClosed) return;

    try {
      await userRepository.deleteUser(uuid);
      await loadSavedUsers();
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(error: e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    _refreshTimer?.cancel();
    return super.close();
  }
}
