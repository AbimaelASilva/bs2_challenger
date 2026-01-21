import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get toFormattedDate {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(this);
  }
}
