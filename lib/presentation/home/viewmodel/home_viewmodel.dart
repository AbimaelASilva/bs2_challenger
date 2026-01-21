import 'package:bloc/bloc.dart';

import '../../../domain/domain.dart';

part 'home_viewmodel_state.dart';

class HomeViewModel extends Cubit<HomeViewModelState> {
  HomeViewModel({required this.userRepository})
      : super(const HomeViewModelState());

  final IUserRepository userRepository;

  Future<void> getRandonUser() async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      await userRepository.getRandonUser();

      final allLocalUsers = await userRepository.getLocalUsers();

      if (!isClosed) {
        emit(
          state.copyWith(
            users: allLocalUsers,
            isLoading: false,
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    } finally {
      if (!isClosed) {
        emit(state.copyWith(isLoading: false));
      }
    }
  }

  Future<void> deleteAllUsers() async {
    if (isClosed) return;

    try {
      await userRepository.deleteAllUsers();

      if (!isClosed) {
        emit(
          state.copyWith(
            users: [],
            isLoading: false,
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(error: e.toString()));
      }
    }
  }
}
