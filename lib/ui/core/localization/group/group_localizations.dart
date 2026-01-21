import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'group_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of GroupLocalizations
/// returned by `GroupLocalizations.of(context)`.
///
/// Applications need to include `GroupLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'group/group_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: GroupLocalizations.localizationsDelegates,
///   supportedLocales: GroupLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the GroupLocalizations.supportedLocales
/// property.
abstract class GroupLocalizations {
  GroupLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static GroupLocalizations of(BuildContext context) {
    return Localizations.of<GroupLocalizations>(context, GroupLocalizations)!;
  }

  static const LocalizationsDelegate<GroupLocalizations> delegate = _GroupLocalizationsDelegate();

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

  /// No description provided for @group.
  ///
  /// In pt, this message translates to:
  /// **'Grupo'**
  String get group;

  /// No description provided for @description.
  ///
  /// In pt, this message translates to:
  /// **'Grupo de atletas'**
  String get description;

  /// No description provided for @sucessCreatedGroup.
  ///
  /// In pt, this message translates to:
  /// **'Grupo criado com sucesso!'**
  String get sucessCreatedGroup;

  /// No description provided for @sucessUpdatedGroup.
  ///
  /// In pt, this message translates to:
  /// **'Grupo atualizado com sucesso!'**
  String get sucessUpdatedGroup;

  /// Atletas por time
  ///
  /// In pt, this message translates to:
  /// **'Atletas por time'**
  String get atheletesByTeam;

  /// Local
  ///
  /// In pt, this message translates to:
  /// **'Local'**
  String get location;

  /// Dia
  ///
  /// In pt, this message translates to:
  /// **'Dia'**
  String get day;

  /// Horário
  ///
  /// In pt, this message translates to:
  /// **'Horário'**
  String get hour;

  /// Convidados
  ///
  /// In pt, this message translates to:
  /// **'Convidados'**
  String get guests;

  /// Associados
  ///
  /// In pt, this message translates to:
  /// **'Associados'**
  String get associates;

  /// Formar equipes
  ///
  /// In pt, this message translates to:
  /// **'Formar equipes'**
  String get formTeams;

  /// Equipes
  ///
  /// In pt, this message translates to:
  /// **'Equipes'**
  String get teams;

  /// Equipe com quantos jogadores?
  ///
  /// In pt, this message translates to:
  /// **'Equipe com quantos jogadores?'**
  String get amountAthleteByTeam;

  /// Quantidade
  ///
  /// In pt, this message translates to:
  /// **'Quantidade'**
  String get quantity;

  /// Sortear
  ///
  /// In pt, this message translates to:
  /// **'Sortear'**
  String get draw;

  /// Selecionado
  ///
  /// In pt, this message translates to:
  /// **'Selecionado'**
  String get selected;

  /// A quantidade de atletas selecionados e jogadores por equipe são incompatíveis
  ///
  /// In pt, this message translates to:
  /// **'A quantidade de atletas selecionados e jogadores por equipe são incompatíveis'**
  String get invalidTeamSize;

  /// Chegada
  ///
  /// In pt, this message translates to:
  /// **'Chegada'**
  String get arrival;

  /// Nenhum time formado
  ///
  /// In pt, this message translates to:
  /// **'Nenhum time formado'**
  String get noTeamFormed;

  /// Adicionar Atleta
  ///
  /// In pt, this message translates to:
  /// **'Adicionar Atleta'**
  String get addAthlete;

  /// Nenhum atleta adicionado.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum atleta adicionado.'**
  String get noAddedAthlete;

  /// No description provided for @settings.
  ///
  /// In pt, this message translates to:
  /// **'Configurações'**
  String get settings;

  /// No description provided for @members.
  ///
  /// In pt, this message translates to:
  /// **'membros'**
  String get members;

  /// No description provided for @editGroup.
  ///
  /// In pt, this message translates to:
  /// **'Editar Grupo'**
  String get editGroup;

  /// No description provided for @addRemoveAdmin.
  ///
  /// In pt, this message translates to:
  /// **'Add/Remover Admin'**
  String get addRemoveAdmin;

  /// No description provided for @leaveGroup.
  ///
  /// In pt, this message translates to:
  /// **'Sair do Grupo'**
  String get leaveGroup;

  /// No description provided for @userName.
  ///
  /// In pt, this message translates to:
  /// **'Nome do usuário'**
  String get userName;

  /// No description provided for @successAddRemoveAdmin.
  ///
  /// In pt, this message translates to:
  /// **'Administradores atualizado com sucesso!'**
  String get successAddRemoveAdmin;

  /// No description provided for @admins.
  ///
  /// In pt, this message translates to:
  /// **'Administradores'**
  String get admins;

  /// No description provided for @addToList.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar à lista de chegada'**
  String get addToList;

  /// No description provided for @noRegisteredAthlete.
  ///
  /// In pt, this message translates to:
  /// **'Ainda não há atletas cadastrados no grupo. Você pode fazer isso ali no menu, no canto superior direito.'**
  String get noRegisteredAthlete;

  /// No description provided for @noSelectedAthlete.
  ///
  /// In pt, this message translates to:
  /// **'Não há nenhum atleta selecionado ou na lista de chegada.'**
  String get noSelectedAthlete;

  /// No description provided for @noGroupToAdmin.
  ///
  /// In pt, this message translates to:
  /// **'Você ainda não administra nenhum grupo. Você pode criar seu próprio grupo!'**
  String get noGroupToAdmin;

  /// No description provided for @team.
  ///
  /// In pt, this message translates to:
  /// **'Equipe'**
  String get team;
}

class _GroupLocalizationsDelegate extends LocalizationsDelegate<GroupLocalizations> {
  const _GroupLocalizationsDelegate();

  @override
  Future<GroupLocalizations> load(Locale locale) {
    return SynchronousFuture<GroupLocalizations>(lookupGroupLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_GroupLocalizationsDelegate old) => false;
}

GroupLocalizations lookupGroupLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'pt': return GroupLocalizationsPt();
  }

  throw FlutterError(
    'GroupLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
