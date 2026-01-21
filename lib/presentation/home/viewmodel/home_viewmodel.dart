import 'package:bloc/bloc.dart';

import '../../../domain/domain.dart';

part 'home_viewmodel_state.dart';

class HomeViewModel extends Cubit<HomeViewModelState> {
  HomeViewModel({required this.userRepository})
      : super(const HomeViewModelState());

  final IUserRepository userRepository;

  Future<void> loadUsers() async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final result = await userRepository.getAllUsers();

      emit(
        state.copyWith(
          users: result,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> refreshUsers() async {
    await loadUsers();
  }

  Future<void> loadMoreUsers() async {
    if (state.isLoadingMore) return;

    try {
      emit(state.copyWith(isLoadingMore: true));

      final result = await userRepository.getAllUsers();
      final updatedUsers = [...state.users, ...result];

      emit(
        state.copyWith(
          users: updatedUsers,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false));
    }
  }
}
