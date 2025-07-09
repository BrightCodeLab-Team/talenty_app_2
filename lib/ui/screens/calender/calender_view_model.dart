import 'package:flutter/material.dart';

class CalendarViewModel extends ChangeNotifier {
  DateTime? selectedDate;

  void selectDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}