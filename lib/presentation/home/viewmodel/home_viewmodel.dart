import 'package:bloc/bloc.dart';

import '../../../domain/domain.dart';

part 'home_viewmodel_state.dart';

class HomeViewModel extends Cubit<HomeViewModelState> {
  HomeViewModel({required this.userRepository})
      : super(const HomeViewModelState());

  final IUserRepository userRepository;

  Future<void> getRandonUser() async {
    if (isClosed) return;

    try {
      if (!isClosed) {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );
      }

      final result = await userRepository.getRandonUser();

      if (!isClosed) {
        emit(
          state.copyWith(
            users: [result],
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

  Future<void> refreshUsers() async {
    await getRandonUser();
  }

  Future<void> loadMoreUsers() async {
    if (isClosed || state.isLoadingMore) return;

    try {
      if (!isClosed) {
        emit(state.copyWith(isLoadingMore: true));
      }

      final result = await userRepository.getRandonUser();
      final updatedUsers = [...state.users, result];

      if (!isClosed) {
        emit(
          state.copyWith(
            users: updatedUsers,
            isLoadingMore: false,
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(isLoadingMore: false));
      }
    }
  }
}
