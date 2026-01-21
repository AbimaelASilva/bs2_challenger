import 'package:intl/intl.dart';

extension StringExtensions on String {
  String get toFormattedDate {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(DateTime.parse(this));
  }
}
