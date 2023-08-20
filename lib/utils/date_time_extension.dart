import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatToShortDate() => DateFormat.MMMEd().format(this);
}
