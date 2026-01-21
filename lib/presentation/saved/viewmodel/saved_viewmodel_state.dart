part of 'saved_viewmodel.dart';

class SavedViewModelState {
  final List<UserEntity> users;
  final bool isLoading;
  final String? error;

  const SavedViewModelState({
    this.users = const [],
    this.isLoading = false,
    this.error,
  });

  SavedViewModelState copyWith({
    List<UserEntity>? users,
    bool? isLoading,
    String? error,
  }) {
    return SavedViewModelState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
