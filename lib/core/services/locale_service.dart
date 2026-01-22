import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocaleService {
  static const String _localeKey = 'app_locale';
  static const Locale defaultLocale = Locale('pt', 'BR');

  static final GetStorage _storage = GetStorage();
  static final ValueNotifier<Locale> _localeNotifier = ValueNotifier<Locale>(defaultLocale);

  static Locale getLocale() {
    final localeString = _storage.read<String>(_localeKey);
    if (localeString == null) {
      return defaultLocale;
    }

    final parts = localeString.split('_');
    Locale locale;
    if (parts.length == 2 && parts[1].isNotEmpty) {
      locale = Locale(parts[0], parts[1]);
    } else if (parts.length == 1) {
      locale = Locale(parts[0]);
    } else {
      locale = defaultLocale;
    }

    _localeNotifier.value = locale;
    return locale;
  }

  static Future<void> setLocale(Locale locale) async {
    final localeString = locale.countryCode != null && locale.countryCode!.isNotEmpty
        ? '${locale.languageCode}_${locale.countryCode}'
        : locale.languageCode;
    await _storage.write(_localeKey, localeString);
    _localeNotifier.value = locale;
  }

  static ValueNotifier<Locale> get localeNotifier => _localeNotifier;

  static List<Locale> getSupportedLocales() {
    return [
      const Locale('pt', 'BR'),
      const Locale('en'),
      const Locale('es'),
    ];
  }
}
