import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatted {
    return DateFormat("MMMd").format(this);
  }
}
