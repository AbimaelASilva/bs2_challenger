import 'package:bloc/bloc.dart';
import '../../../domain/domain.dart';

part 'saved_viewmodel_state.dart';

class SavedViewModel extends Cubit<SavedViewModelState> {
  SavedViewModel({required this.userRepository})
      : super(const SavedViewModelState()) {
    loadSavedUsers();
  }

  final IUserRepository userRepository;

  Future<void> loadSavedUsers() async {
    if (isClosed) return;

    try {
      emit(state.copyWith(isLoading: true));
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
}
