import 'package:bloc/bloc.dart';

import '../../../domain/domain.dart';

part 'home_viewmodel_state.dart';

class HomeViewModel extends Cubit<HomeViewModelState> {
  HomeViewModel({required this.userRepository})
      : super(const HomeViewModelState());

  final IUserRepository userRepository;

  Future<void> getRandonUser() async {
    if (isClosed || state.isLoading) return;

    try {
      if (!isClosed) {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );
      }

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
    }
  }

  // Future<void> refreshUsers() async {
  //   await getRandonUser();
  // }

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
