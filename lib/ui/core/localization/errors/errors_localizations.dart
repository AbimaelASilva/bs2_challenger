import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'errors_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ErrorsLocalizations
/// returned by `ErrorsLocalizations.of(context)`.
///
/// Applications need to include `ErrorsLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'errors/errors_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ErrorsLocalizations.localizationsDelegates,
///   supportedLocales: ErrorsLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the ErrorsLocalizations.supportedLocales
/// property.
abstract class ErrorsLocalizations {
  ErrorsLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ErrorsLocalizations of(BuildContext context) {
    return Localizations.of<ErrorsLocalizations>(context, ErrorsLocalizations)!;
  }

  static const LocalizationsDelegate<ErrorsLocalizations> delegate = _ErrorsLocalizationsDelegate();

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

  /// No description provided for @defaultError.
  ///
  /// In pt, this message translates to:
  /// **'Não conseguimos processar sua solicitação. Verifique a internet, e tente novamente!'**
  String get defaultError;

  /// No description provided for @nameIsTooShort.
  ///
  /// In pt, this message translates to:
  /// **'O texto informado é muito curto'**
  String get nameIsTooShort;

  /// No description provided for @requiredField.
  ///
  /// In pt, this message translates to:
  /// **'Campo obrigatório'**
  String get requiredField;

  /// No description provided for @passwordsAreDifferent.
  ///
  /// In pt, this message translates to:
  /// **'As senhas são diferentes'**
  String get passwordsAreDifferent;

  /// No description provided for @invalidDate.
  ///
  /// In pt, this message translates to:
  /// **'Data inválida'**
  String get invalidDate;

  /// No description provided for @errorRegisterUser.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível cadastrar o usuário. Verifique os dados e a internet e tente novamente'**
  String get errorRegisterUser;

  /// No description provided for @errorLogin.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível fazer login. Verifique os dados e a internet e tente novamente'**
  String get errorLogin;

  /// No description provided for @erroLoadingMatches.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar as partidas. Verifique a internet'**
  String get erroLoadingMatches;

  /// No description provided for @loadingGroup.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar os grupos. Verifique a internet'**
  String get loadingGroup;

  /// No description provided for @registerGroup.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível criar o grupo. Verifique os dados, internet e tente novamente'**
  String get registerGroup;

  /// No description provided for @updateGroup.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível atualizar o grupo. Verifique os dados e a internet e tente novamente'**
  String get updateGroup;

  /// No description provided for @registerAthlete.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível cadastrar o atleta. Verifique os dados, internet e tente novamente'**
  String get registerAthlete;

  /// No description provided for @updateAthlete.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível atualizar o atleta. Verifique os dados, internet e tente novamente'**
  String get updateAthlete;

  /// No description provided for @addRemoveAdmin.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível atualizar o admin. Verifique os dados, internet e tente novamente'**
  String get addRemoveAdmin;

  /// No description provided for @code204.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum valor retornado do servidor'**
  String get code204;

  /// No description provided for @code304.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum valor modificado no servidor'**
  String get code304;

  /// No description provided for @code400.
  ///
  /// In pt, this message translates to:
  /// **'O servidor não pode processar a solicitação, reveja os campos e tente novamente.'**
  String get code400;

  /// No description provided for @code401.
  ///
  /// In pt, this message translates to:
  /// **'Você precisa renovar as credenciais, deslogue e logue novamente!'**
  String get code401;

  /// No description provided for @code403.
  ///
  /// In pt, this message translates to:
  /// **'O servidor recusou a solicitação'**
  String get code403;

  /// No description provided for @code404.
  ///
  /// In pt, this message translates to:
  /// **'O servidor não conseguiu encontrar resultados a partir dos dados solicitados.'**
  String get code404;

  /// No description provided for @code405.
  ///
  /// In pt, this message translates to:
  /// **'Método desabilitado'**
  String get code405;

  /// No description provided for @code406.
  ///
  /// In pt, this message translates to:
  /// **'O servidor é incapaz de retornar os conteúdos solicitados'**
  String get code406;

  /// No description provided for @code500.
  ///
  /// In pt, this message translates to:
  /// **'O servidor encontrou uma condição inesperada, se o problema persistir contate o suporte'**
  String get code500;

  /// No description provided for @loadPositions.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível caregar a lista de posições. Verifique ainternet e tente novamente'**
  String get loadPositions;

  /// No description provided for @errorSendingSms.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao solicitar SMS para reset de senha'**
  String get errorSendingSms;

  /// No description provided for @errorConfirmSms.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao confirmar SMS para reset de senha'**
  String get errorConfirmSms;

  /// No description provided for @errorPasswordReset.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao solicitar reset de senha'**
  String get errorPasswordReset;

  /// No description provided for @errorUpdateData.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao atualizar os dados'**
  String get errorUpdateData;
}

class _ErrorsLocalizationsDelegate extends LocalizationsDelegate<ErrorsLocalizations> {
  const _ErrorsLocalizationsDelegate();

  @override
  Future<ErrorsLocalizations> load(Locale locale) {
    return SynchronousFuture<ErrorsLocalizations>(lookupErrorsLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_ErrorsLocalizationsDelegate old) => false;
}

ErrorsLocalizations lookupErrorsLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'pt': return ErrorsLocalizationsPt();
  }

  throw FlutterError(
    'ErrorsLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
