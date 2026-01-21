part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.email,
    required this.password,
    required this.error,
    required this.status,
  });

  const LoginState.initial()
      : this(
          status: AppStateStatus.initial,
          email: '',
          password: '',
          error: '',
        );
  final String email;
  final String password;
  final String error;
  final AppStateStatus status;

  LoginState copyWith({
    String? email,
    String? password,
    String? error,
    AppStateStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        error,
        status,
      ];
}
