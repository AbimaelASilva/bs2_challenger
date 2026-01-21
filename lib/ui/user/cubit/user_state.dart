part of 'user_cubit.dart';

class UserCreateEditState extends Equatable {
  const UserCreateEditState({
    required this.user,
    required this.error,
    required this.status,
    required this.confirmPassword,
    required this.isAllFieldsValidates,
    required this.acceptedTerms,
    //
    required this.nameError,
    required this.emailError,
    required this.phoneError,
    required this.passwordError,
    required this.confirmPasswordError,
    required this.nameErrorStream,
    required this.phoneErrorStream,
    required this.passwordErrorStream,
    required this.confirmPasswordErrorStream,
    required this.birthDateErrorStream,
  });

  UserCreateEditState.initial()
      : this(
          user: UserModel.empty(),
          status: AppStateStatus.initial,
          error: '',
          confirmPassword: '',
          isAllFieldsValidates: false,
          acceptedTerms: false,
          //
          nameError: UIError.empty,
          emailError: UIError.empty,
          phoneError: UIError.empty,
          passwordError: UIError.empty,
          confirmPasswordError: UIError.empty,
          nameErrorStream: UIError.empty,
          phoneErrorStream: UIError.empty,
          passwordErrorStream: UIError.empty,
          confirmPasswordErrorStream: UIError.empty,
          birthDateErrorStream: UIError.empty,
        );

  final UserModel user;
  final String error;
  final AppStateStatus status;
  final bool isAllFieldsValidates;
  final String confirmPassword;
  final bool acceptedTerms;

  //ERROS
  final UIError nameError;
  final UIError emailError;
  final UIError phoneError;
  final UIError passwordError;
  final UIError confirmPasswordError;
  final UIError nameErrorStream;
  final UIError phoneErrorStream;
  final UIError passwordErrorStream;
  final UIError confirmPasswordErrorStream;
  final UIError birthDateErrorStream;

  UserCreateEditState copyWith({
    UserModel? user,
    String? error,
    String? confirmPassword,
    AppStateStatus? status,
    bool? isAllFieldsValidates,
    bool? acceptedTerms,
    //
    UIError? nameError,
    UIError? emailError,
    UIError? phoneError,
    UIError? passwordError,
    UIError? confirmPasswordError,
    UIError? passwordErrorStream,
    UIError? confirmPasswordErrorStream,
    UIError? birthDateErrorStream,
  }) {
    return UserCreateEditState(
      user: user ?? this.user,
      error: error ?? this.error,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      isAllFieldsValidates: isAllFieldsValidates ?? this.isAllFieldsValidates,
      acceptedTerms: acceptedTerms ?? this.acceptedTerms,
      //
      nameError: nameError ?? this.nameError,
      emailError: emailError ?? this.emailError,
      phoneError: phoneError ?? this.phoneError,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      nameErrorStream: nameError ?? nameErrorStream,
      phoneErrorStream: phoneError ?? phoneErrorStream,
      passwordErrorStream: passwordErrorStream ?? this.passwordErrorStream,
      confirmPasswordErrorStream:
          confirmPasswordErrorStream ?? this.confirmPasswordErrorStream,
      birthDateErrorStream: birthDateErrorStream ?? this.birthDateErrorStream,
    );
  }

  @override
  List<Object> get props => [
        user,
        error,
        status,
        confirmPassword,
        isAllFieldsValidates,
        acceptedTerms,
        //
        nameError,
        emailError,
        phoneError,
        passwordError,
        confirmPasswordError,
        nameErrorStream,
        phoneErrorStream,
        passwordErrorStream,
        confirmPasswordErrorStream,
        birthDateErrorStream,
      ];
}
