import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'sign_up_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of SignUpLocalizations
/// returned by `SignUpLocalizations.of(context)`.
///
/// Applications need to include `SignUpLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'sign_up/sign_up_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: SignUpLocalizations.localizationsDelegates,
///   supportedLocales: SignUpLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the SignUpLocalizations.supportedLocales
/// property.
abstract class SignUpLocalizations {
  SignUpLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static SignUpLocalizations of(BuildContext context) {
    return Localizations.of<SignUpLocalizations>(context, SignUpLocalizations)!;
  }

  static const LocalizationsDelegate<SignUpLocalizations> delegate = _SignUpLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('pt')
  ];

  /// No description provided for @name.
  ///
  /// In pt, this message translates to:
  /// **'Nome'**
  String get name;

  /// No description provided for @phone.
  ///
  /// In pt, this message translates to:
  /// **'Telefone'**
  String get phone;

  /// No description provided for @createPassword.
  ///
  /// In pt, this message translates to:
  /// **'Criar senha'**
  String get createPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar senha'**
  String get confirmPassword;

  /// No description provided for @bePart.
  ///
  /// In pt, this message translates to:
  /// **'Fazer parte'**
  String get bePart;

  /// No description provided for @yourPhoneNumber.
  ///
  /// In pt, this message translates to:
  /// **'Seu número de telefone'**
  String get yourPhoneNumber;

  /// No description provided for @minCharacterNumber.
  ///
  /// In pt, this message translates to:
  /// **'Sua senha dever no mínimo 6 caracteres'**
  String get minCharacterNumber;

  /// No description provided for @birthdate.
  ///
  /// In pt, this message translates to:
  /// **'Data de Nascimento'**
  String get birthdate;

  /// No description provided for @gender.
  ///
  /// In pt, this message translates to:
  /// **'Gênero'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In pt, this message translates to:
  /// **'Masculino'**
  String get male;

  /// No description provided for @female.
  ///
  /// In pt, this message translates to:
  /// **'Feminino'**
  String get female;

  /// No description provided for @other.
  ///
  /// In pt, this message translates to:
  /// **'Outro'**
  String get other;

  /// No description provided for @notInfo.
  ///
  /// In pt, this message translates to:
  /// **'Não informado'**
  String get notInfo;

  /// No description provided for @successRegisterUser.
  ///
  /// In pt, this message translates to:
  /// **'Show! Usuário cadastrado com sucesso!'**
  String get successRegisterUser;

  /// No description provided for @successLogin.
  ///
  /// In pt, this message translates to:
  /// **'Maravilha! Você está logado!'**
  String get successLogin;

  /// No description provided for @user.
  ///
  /// In pt, this message translates to:
  /// **'Usuário'**
  String get user;

  /// No description provided for @password.
  ///
  /// In pt, this message translates to:
  /// **'Senha'**
  String get password;

  /// No description provided for @login.
  ///
  /// In pt, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @enter.
  ///
  /// In pt, this message translates to:
  /// **'Entrar'**
  String get enter;

  /// No description provided for @forgotPassword.
  ///
  /// In pt, this message translates to:
  /// **'Esqueceu sua senha?'**
  String get forgotPassword;

  /// No description provided for @register.
  ///
  /// In pt, this message translates to:
  /// **'Criar conta'**
  String get register;

  /// No description provided for @recoverPassword.
  ///
  /// In pt, this message translates to:
  /// **'Recuperar senha'**
  String get recoverPassword;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In pt, this message translates to:
  /// **'Número do telefone'**
  String get enterPhoneNumber;

  /// No description provided for @send.
  ///
  /// In pt, this message translates to:
  /// **'Enviar'**
  String get send;

  /// No description provided for @enterSmsCode.
  ///
  /// In pt, this message translates to:
  /// **'Informe o código recebido por SMS'**
  String get enterSmsCode;

  /// No description provided for @smsCode.
  ///
  /// In pt, this message translates to:
  /// **'Código SMS'**
  String get smsCode;

  /// No description provided for @back.
  ///
  /// In pt, this message translates to:
  /// **'Voltar'**
  String get back;

  /// No description provided for @verify.
  ///
  /// In pt, this message translates to:
  /// **'Verificar'**
  String get verify;

  /// No description provided for @enterNewPassword.
  ///
  /// In pt, this message translates to:
  /// **'Nova senha'**
  String get enterNewPassword;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Senha resetada com sucesso!'**
  String get passwordResetSuccess;

  /// No description provided for @phoneRecoveryInfoMessage.
  ///
  /// In pt, this message translates to:
  /// **'Importante informar o número do seu telefone celular, pois será nescessário para login e recuperação de senha.'**
  String get phoneRecoveryInfoMessage;

  /// No description provided for @recoverPhoneValidationMessage.
  ///
  /// In pt, this message translates to:
  /// **'Para conseguir recuperar sua senha com o número de telefone, você precisa ter informado este mesmo número no seu cadastro de usuário.'**
  String get recoverPhoneValidationMessage;

  /// No description provided for @successUpdatedYourDatas.
  ///
  /// In pt, this message translates to:
  /// **'Sucesso! Seus dados foram atualizados!'**
  String get successUpdatedYourDatas;
}

class _SignUpLocalizationsDelegate extends LocalizationsDelegate<SignUpLocalizations> {
  const _SignUpLocalizationsDelegate();

  @override
  Future<SignUpLocalizations> load(Locale locale) {
    return SynchronousFuture<SignUpLocalizations>(lookupSignUpLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_SignUpLocalizationsDelegate old) => false;
}

SignUpLocalizations lookupSignUpLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'pt': return SignUpLocalizationsPt();
  }

  throw FlutterError(
    'SignUpLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
