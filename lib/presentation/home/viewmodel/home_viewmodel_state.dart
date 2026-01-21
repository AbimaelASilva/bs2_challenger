part of 'home_viewmodel.dart';

class HomeViewModelState {
  final List<UserEntity> users;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;

  const HomeViewModelState({
    this.users = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
  });

  HomeViewModelState copyWith({
    List<UserEntity>? users,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
  }) {
    return HomeViewModelState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error ?? this.error,
    );
  }
}
