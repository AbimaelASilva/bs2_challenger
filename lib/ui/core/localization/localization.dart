import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/app_localizations.dart';
import 'athlete/athlete_localizations.dart';
import 'championships/championships_localizations.dart';
import 'errors/errors_localizations.dart';
import 'group/group_localizations.dart';
import 'home/home_localizations.dart';
import 'map/map_localizations.dart';

import 'sign_up/sign_up_localizations.dart';

class AppTranslate {
  AppTranslate(this.context);
  final BuildContext context;
  AppLocalizations get app => AppLocalizations.of(context);
  HomeLocalizations get home => HomeLocalizations.of(context);
  MapLocalizations get map => MapLocalizations.of(context);
  GroupLocalizations get group => GroupLocalizations.of(context);
  AthleteLocalizations get athlete => AthleteLocalizations.of(context);
  SignUpLocalizations get signUp => SignUpLocalizations.of(context);
  ChampionshipsLocalizations get championships =>
      ChampionshipsLocalizations.of(context);
  ErrorsLocalizations get erros => ErrorsLocalizations.of(context);
}

/// Callers can lookup localized strings with an instance of IsAppLocalizations
/// Use like context.tr.helloWorld
extension AppTranslateExtension on BuildContext {
  /// The translations for this app in the current locale.
  AppTranslate get tr => AppTranslate(this);

  Iterable<LocalizationsDelegate<dynamic>>? get localizationsDelegates => [
        AppLocalizations.delegate,
        SignUpLocalizations.delegate,
        HomeLocalizations.delegate,
        MapLocalizations.delegate,
        GroupLocalizations.delegate,
        AthleteLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        ChampionshipsLocalizations.delegate,
        ErrorsLocalizations.delegate,
      ];

  Iterable<Locale> get supportedLocales => [
        ...AppLocalizations.supportedLocales,
        ...SignUpLocalizations.supportedLocales,
        ...HomeLocalizations.supportedLocales,
        ...MapLocalizations.supportedLocales,
        ...GroupLocalizations.supportedLocales,
        ...AthleteLocalizations.supportedLocales,
        ...ChampionshipsLocalizations.supportedLocales,
        ...ErrorsLocalizations.supportedLocales,
      ];

  /// The current locale.
  Locale get currentLocale => Localizations.localeOf(this);
}
