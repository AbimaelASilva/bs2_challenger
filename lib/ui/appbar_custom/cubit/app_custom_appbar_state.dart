part of 'app_custom_appbar_cubit.dart';

class AppCustomAppbarState extends Equatable {
  const AppCustomAppbarState({
    required this.error,
    required this.status,
    required this.user,
    required this.userName,
  });

  AppCustomAppbarState.initial()
      : this(
          status: AppStateStatus.initial,
          error: '',
          user: UserModel.empty(),
          userName: '',
        );

  final String error;
  final AppStateStatus status;

  final UserModel user;
  final String userName;

  AppCustomAppbarState copyWith({
    String? error,
    AppStateStatus? status,
    UserModel? user,
    String? userName,
    bool? loadingGroupsList,
  }) {
    return AppCustomAppbarState(
      error: error ?? this.error,
      status: status ?? this.status,
      user: user ?? this.user,
      userName: userName ?? this.userName,
    );
  }

  @override
  List<Object> get props => [
        error,
        status,
        user,
        userName,
      ];
}
