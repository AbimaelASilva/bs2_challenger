part of 'user_details_viewmodel.dart';

class UserDetailsViewModelState {
  final UserEntity? user;
  final bool isLoading;
  final bool isSaved;
  final String? error;

  const UserDetailsViewModelState({
    this.user,
    this.isLoading = false,
    this.isSaved = false,
    this.error,
  });

  UserDetailsViewModelState copyWith({
    UserEntity? user,
    bool? isLoading,
    bool? isSaved,
    String? error,
  }) {
    return UserDetailsViewModelState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isSaved: isSaved ?? this.isSaved,
      error: error ?? this.error,
    );
  }
}
