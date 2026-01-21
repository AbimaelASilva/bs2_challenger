// ignore_for_file: use_raw_strings

import '../../../../domain/domain.dart';
import '../../../core/core.dart';

class AppCurrencyMoney {
  static const String _customPattern = '\u00a4 #,##0.00';
  static const int decimalDigits = 2;

  static CountryModel get _country {
    final countryModel = CountryModel(
      id: 0,
      country: "Brasil",
      ddi: "+55",
      coin: "R\$",
      coinName: "BRL",
      masked: "",
    );
    return countryModel;
  }

  static String get _locale {
    String locale = 'es_US';
    if (_country.coinName == "BRL") {
      locale = 'pt_BR';
    }
    return locale;
  }

  static String print(double? value) {
    if (value == null) return "";
    return CurrencyTextInputFormatter(
      customPattern: _customPattern,
      locale: _locale,
      symbol: _country.coin,
      decimalDigits: decimalDigits,
    ).format(value.toStringAsFixed(2));
  }

  static String initial(double? value) {
    return CurrencyTextInputFormatter(
      customPattern: _customPattern,
      locale: _locale,
      decimalDigits: decimalDigits,
    ).format(value?.toStringAsFixed(2) ?? '');
  }

  static String noSimbol(double? value) {
    return CurrencyTextInputFormatter.noSimbol(
      customPattern: _customPattern,
      decimalDigits: decimalDigits,
      locale: _locale,
    ).format(value?.toStringAsFixed(2) ?? '');
  }

  static CurrencyTextInputFormatter get formatter {
    return CurrencyTextInputFormatter(
      customPattern: _customPattern,
      decimalDigits: decimalDigits,
      locale: _locale,
    );
  }

  static CurrencyTextInputFormatter get formatterNoSimbol {
    return CurrencyTextInputFormatter.noSimbol(
      customPattern: _customPattern,
      decimalDigits: decimalDigits,
      locale: _locale,
    );
  }

  static String original(String value) {
    return CurrencyTextInputFormatter(
      decimalDigits: decimalDigits,
      locale: "es_US",
    ).format(value);
  }
}
