part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.error,
    required this.status,
    required this.user,
    required this.userName,

    //
    required this.passwordRecoveryStep,
    required this.passwordRecoveryPhone,
    required this.passwordRecoverySmsCode,
    required this.resetToken,
    required this.passwordRecoveryNewPassword,
    required this.passwordRecoveryConfirmPassword,
    required this.loadingPasswordRecovery,
    required this.themeMode,
  });

  HomeState.initial()
      : this(
          status: AppStateStatus.initial,

          error: '',

          user: UserModel.empty(),
          userName: '',

          //
          passwordRecoveryStep: 0,
          passwordRecoveryPhone: '',
          passwordRecoverySmsCode: '',
          resetToken: '',
          passwordRecoveryNewPassword: '',
          passwordRecoveryConfirmPassword: '',
          loadingPasswordRecovery: false,
          themeMode: ThemeMode.light,
        );

  final String error;
  final AppStateStatus status;

  final UserModel user;
  final String userName;

  //
  final int passwordRecoveryStep;
  final String passwordRecoveryPhone;
  final String passwordRecoverySmsCode;
  final String resetToken;
  final String passwordRecoveryNewPassword;
  final String passwordRecoveryConfirmPassword;
  final bool loadingPasswordRecovery;
  final ThemeMode themeMode;

  HomeState copyWith({
    String? error,
    AppStateStatus? status,
    UserModel? user,
    String? userName,

    //
    int? passwordRecoveryStep,
    String? passwordRecoveryPhone,
    String? resetToken,
    String? passwordRecoverySmsCode,
    String? passwordRecoveryNewPassword,
    String? passwordRecoveryConfirmPassword,
    bool? loadingPasswordRecovery,
    ThemeMode? themeMode,
  }) {
    return HomeState(
      error: error ?? this.error,
      status: status ?? this.status,

      user: user ?? this.user,
      userName: userName ?? this.userName,

      //
      passwordRecoveryStep: passwordRecoveryStep ?? this.passwordRecoveryStep,
      passwordRecoveryPhone:
          passwordRecoveryPhone ?? this.passwordRecoveryPhone,
      passwordRecoverySmsCode:
          passwordRecoverySmsCode ?? this.passwordRecoverySmsCode,
      resetToken: resetToken ?? this.resetToken,
      passwordRecoveryNewPassword:
          passwordRecoveryNewPassword ?? this.passwordRecoveryNewPassword,
      passwordRecoveryConfirmPassword: passwordRecoveryConfirmPassword ??
          this.passwordRecoveryConfirmPassword,
      loadingPasswordRecovery:
          loadingPasswordRecovery ?? this.loadingPasswordRecovery,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object> get props => [
        error,
        status,

        user,
        userName,

        //
        passwordRecoveryStep,
        resetToken,
        passwordRecoveryPhone,
        passwordRecoverySmsCode,
        passwordRecoveryNewPassword,
        passwordRecoveryConfirmPassword,
        loadingPasswordRecovery,
        themeMode,
      ];
}
