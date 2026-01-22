import 'package:flutter/material.dart';

import 'translations/en_translations.dart';
import 'translations/es_translations.dart';
import 'translations/pt_translations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  String get appTitle => _getLocalizedValue('appTitle');
  String get challenge => _getLocalizedValue('challenge');
  String get randomUsers => _getLocalizedValue('randomUsers');
  String get savedUsers => _getLocalizedValue('savedUsers');
  String get userDetails => _getLocalizedValue('userDetails');
  String get search => _getLocalizedValue('search');
  String get saved => _getLocalizedValue('saved');
  String get searchPlaceholder => _getLocalizedValue('searchPlaceholder');
  String usersFound(int count) =>
      _getLocalizedValue('usersFound', {'count': count});
  String savedUsersFound(int count) =>
      _getLocalizedValue('savedUsersFound', {'count': count});
  String get fetchingMoreUsers => _getLocalizedValue('fetchingMoreUsers');
  String get error => _getLocalizedValue('error');
  String get tryAgain => _getLocalizedValue('tryAgain');
  String get noUsersSaved => _getLocalizedValue('noUsersSaved');
  String get userNotFound => _getLocalizedValue('userNotFound');
  String get back => _getLocalizedValue('back');
  String get remove => _getLocalizedValue('remove');
  String get save => _getLocalizedValue('save');
  String get removeFromSaved => _getLocalizedValue('removeFromSaved');
  String get saveUser => _getLocalizedValue('saveUser');
  String get userRemovedSuccess => _getLocalizedValue('userRemovedSuccess');
  String get userSavedSuccess => _getLocalizedValue('userSavedSuccess');
  String get userAlreadySaved => _getLocalizedValue('userAlreadySaved');
  String get confirmDelete => _getLocalizedValue('confirmDelete');
  String get confirmDeleteAllMessage =>
      _getLocalizedValue('confirmDeleteAllMessage');
  String get cancel => _getLocalizedValue('cancel');
  String get delete => _getLocalizedValue('delete');
  String get removeUser => _getLocalizedValue('removeUser');
  String get confirmRemoveUserMessage =>
      _getLocalizedValue('confirmRemoveUserMessage');
  String get personalInfo => _getLocalizedValue('personalInfo');
  String get location => _getLocalizedValue('location');
  String get login => _getLocalizedValue('login');
  String get dateOfBirth => _getLocalizedValue('dateOfBirth');
  String get registered => _getLocalizedValue('registered');
  String get identification => _getLocalizedValue('identification');
  String get pictures => _getLocalizedValue('pictures');
  String get gender => _getLocalizedValue('gender');
  String get phone => _getLocalizedValue('phone');
  String get cell => _getLocalizedValue('cell');
  String get nationality => _getLocalizedValue('nationality');
  String get address => _getLocalizedValue('address');
  String get city => _getLocalizedValue('city');
  String get state => _getLocalizedValue('state');
  String get country => _getLocalizedValue('country');
  String get postcode => _getLocalizedValue('postcode');
  String get coordinates => _getLocalizedValue('coordinates');
  String get timezone => _getLocalizedValue('timezone');
  String get uuid => _getLocalizedValue('uuid');
  String get username => _getLocalizedValue('username');
  String get password => _getLocalizedValue('password');
  String get salt => _getLocalizedValue('salt');
  String get md5 => _getLocalizedValue('md5');
  String get sha1 => _getLocalizedValue('sha1');
  String get sha256 => _getLocalizedValue('sha256');
  String get date => _getLocalizedValue('date');
  String get age => _getLocalizedValue('age');
  String years(int count) => _getLocalizedValue('years', {'count': count});
  String get registrationDate => _getLocalizedValue('registrationDate');
  String get registrationTime => _getLocalizedValue('registrationTime');
  String get type => _getLocalizedValue('type');
  String get value => _getLocalizedValue('value');
  String get large => _getLocalizedValue('large');
  String get medium => _getLocalizedValue('medium');
  String get thumbnail => _getLocalizedValue('thumbnail');
  String get selectLanguage => _getLocalizedValue('selectLanguage');
  String get portuguese => _getLocalizedValue('portuguese');
  String get english => _getLocalizedValue('english');
  String get spanish => _getLocalizedValue('spanish');

  String _getLocalizedValue(String key, [Map<String, dynamic>? params]) {
    final translations = _getTranslations();
    String value = translations[key] ?? key;

    if (params != null) {
      params.forEach((paramKey, paramValue) {
        if (paramKey == 'count') {
          value = _handlePlural(value, paramValue as int);
        } else {
          value = value.replaceAll('{$paramKey}', paramValue.toString());
        }
      });
    }

    return value;
  }

  String _handlePlural(String template, int count) {
    if (!template.contains('{count, plural')) {
      return template.replaceAll('{count}', count.toString());
    }

    String? result;

    if (count == 0 && template.contains('=0{')) {
      result = _extractPluralContent(template, '=0{');
    } else if (count == 1 && template.contains('=1{')) {
      result = _extractPluralContent(template, '=1{');
    }

    if (result == null && template.contains('other{')) {
      result = _extractPluralContent(template, 'other{');
    }

    result ??= template;
    return result.replaceAll('{count}', count.toString());
  }

  String? _extractPluralContent(String template, String pattern) {
    final startIndex = template.indexOf(pattern);
    if (startIndex == -1) return null;

    final contentStart = startIndex + pattern.length;
    int braceCount = 0;
    int endIndex = contentStart;

    for (int i = contentStart; i < template.length; i++) {
      if (template[i] == '{') {
        braceCount++;
      } else if (template[i] == '}') {
        if (braceCount == 0) {
          endIndex = i;
          break;
        }
        braceCount--;
      }
    }

    if (endIndex > contentStart) {
      return template.substring(contentStart, endIndex).trim();
    }

    return null;
  }

  Map<String, String> _getTranslations() {
    switch (locale.languageCode) {
      case 'pt':
        return PtTranslations.translations;
      case 'en':
        return EnTranslations.translations;
      case 'es':
        return EsTranslations.translations;
      default:
        return PtTranslations.translations;
    }
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['pt', 'en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => true;
}
