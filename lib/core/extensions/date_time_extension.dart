extension DateTimeFormat on DateTime {
  /// Formato DD/MM/YYYY
  String get toDDMMYYYY {
    return "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year.toString().padLeft(4, '0')}";
  }

  /// Formato DD/MM/YY
  String get toDDMMYY {
    return "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year.toString().substring(2)}";
  }

  /// Formato HH:mm
  String get toHHmm {
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
  }

  String get dayNumber {
    return weekday.toString();
  }

  DateTime adjustTime({int hours = 0, int minutes = 0, int seconds = 0}) {
    return DateTime(
      year,
      month,
      day,
      hour + hours,
      minute + minutes,
      second + seconds,
      millisecond,
      microsecond,
    );
  }

  DateTime subtractHours(int hours) {
    return subtract(Duration(hours: hours));
  }

  ///Format YYYY-MM-DD
  String get toDateInternacional {
    return '${year.toString().padLeft(4, '0')}-'
        '${month.toString().padLeft(2, '0')}-'
        '${day.toString().padLeft(2, '0')}';
  }

  String get toMMYYYY {
    final mes = month.toString().padLeft(2, '0');
    final ano = year.toString();
    return '$mes/$ano';
  }
}
