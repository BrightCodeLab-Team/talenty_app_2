// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

class DateTimeService {
  static formateDate(DateTime? dateTime) {
    final dateFormat = DateFormat.yMd();
    if (dateTime != null) return dateFormat.format(dateTime);
  }
}
