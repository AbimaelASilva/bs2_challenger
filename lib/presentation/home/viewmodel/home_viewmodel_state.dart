part of 'home_viewmodel.dart';

class HomeViewModelState {
  final List<UserEntity> users;
  final List<UserEntity> filteredUsers;
  final bool isLoading;
  final String? error;
  final String searchQuery;

  const HomeViewModelState({
    this.users = const [],
    this.filteredUsers = const [],
    this.isLoading = false,
    this.error,
    this.searchQuery = '',
  });

  HomeViewModelState copyWith({
    List<UserEntity>? users,
    List<UserEntity>? filteredUsers,
    bool? isLoading,
    String? error,
    String? searchQuery,
  }) {
    return HomeViewModelState(
      users: users ?? this.users,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
