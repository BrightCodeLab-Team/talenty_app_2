import 'package:flutter/material.dart';

class MasCalendarViewModel extends ChangeNotifier {
  DateTime? selectedDate;

  void selectDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}
