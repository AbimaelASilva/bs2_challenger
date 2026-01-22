import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocaleService {
  static const String _localeKey = 'app_locale';
  static const Locale defaultLocale = Locale('pt', 'BR');

  static final GetStorage _storage = GetStorage();

  static Locale getLocale() {
    final localeString = _storage.read<String>(_localeKey);
    if (localeString == null) {
      return defaultLocale;
    }

    final parts = localeString.split('_');
    if (parts.length == 2) {
      return Locale(parts[0], parts[1]);
    } else if (parts.length == 1) {
      return Locale(parts[0]);
    }

    return defaultLocale;
  }

  static Future<void> setLocale(Locale locale) async {
    final localeString = '${locale.languageCode}_${locale.countryCode ?? ''}';
    await _storage.write(_localeKey, localeString);
  }

  static List<Locale> getSupportedLocales() {
    return [
      const Locale('pt', 'BR'),
      const Locale('en'),
      const Locale('es'),
    ];
  }
}
