import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocaleService {
  static const String _localeKey = 'app_locale';
  static const String _userSelectedKey = 'user_selected_locale';
  static const Locale fallbackLocale = Locale('pt', 'BR');

  static final GetStorage _storage = GetStorage();
  static final ValueNotifier<Locale> _localeNotifier =
      ValueNotifier<Locale>(fallbackLocale);

  static Locale _getDeviceLocale() {
    final systemLocales = WidgetsBinding.instance.platformDispatcher.locales;
    if (systemLocales.isNotEmpty) {
      final deviceLocale = systemLocales.first;
      final supportedLocales = getSupportedLocales();

      for (final supported in supportedLocales) {
        if (supported.languageCode == deviceLocale.languageCode) {
          if (supported.countryCode == null ||
              supported.countryCode == deviceLocale.countryCode) {
            return supported;
          }
        }
      }

      final languageMatch = supportedLocales.firstWhere(
        (locale) => locale.languageCode == deviceLocale.languageCode,
        orElse: () => fallbackLocale,
      );

      if (languageMatch != fallbackLocale) {
        return languageMatch;
      }
    }

    return fallbackLocale;
  }

  static Locale getLocale() {
    final userSelected = _storage.read<bool>(_userSelectedKey);

    if (userSelected == true) {
      final localeString = _storage.read<String>(_localeKey);
      if (localeString != null) {
        final parts = localeString.split('_');
        Locale locale;
        if (parts.length == 2 && parts[1].isNotEmpty) {
          locale = Locale(parts[0], parts[1]);
        } else if (parts.length == 1) {
          locale = Locale(parts[0]);
        } else {
          locale = _getDeviceLocale();
        }

        if (_isLocaleSupported(locale)) {
          _localeNotifier.value = locale;
          return locale;
        }
      }
    }

    final deviceLocale = _getDeviceLocale();
    _localeNotifier.value = deviceLocale;
    return deviceLocale;
  }

  static bool _isLocaleSupported(Locale locale) {
    return getSupportedLocales().any(
      (supported) =>
          supported.languageCode == locale.languageCode &&
          (supported.countryCode == null ||
              supported.countryCode == locale.countryCode),
    );
  }

  static Future<void> setLocale(Locale locale) async {
    if (!_isLocaleSupported(locale)) {
      return;
    }

    final localeString =
        locale.countryCode != null && locale.countryCode!.isNotEmpty
            ? '${locale.languageCode}_${locale.countryCode}'
            : locale.languageCode;

    await _storage.write(_localeKey, localeString);
    await _storage.write(_userSelectedKey, true);
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
