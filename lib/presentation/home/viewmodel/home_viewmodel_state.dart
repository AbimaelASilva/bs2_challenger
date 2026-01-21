part of 'home_viewmodel.dart';

class HomeViewModelState {
  final List<UserEntity> users;
  final bool isLoading;

  final String? error;

  const HomeViewModelState({
    this.users = const [],
    this.isLoading = false,
    this.error,
  });

  HomeViewModelState copyWith({
    List<UserEntity>? users,
    bool? isLoading,
    String? error,
  }) {
    return HomeViewModelState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
