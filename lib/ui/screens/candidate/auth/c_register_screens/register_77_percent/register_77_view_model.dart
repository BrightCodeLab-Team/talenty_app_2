import 'package:flutter/material.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class CandidateRegister77percentViewModel extends BaseViewModel {
  bool isFirstDropDownOpen = false;
  bool isSecondDropDownOpen = false;

  void toggleFirstDropdown() {
    isFirstDropDownOpen = !isFirstDropDownOpen;
    notifyListeners();
  }

  void setFirstDropdown(bool val) {
    isFirstDropDownOpen = val;
    notifyListeners();
  }

  void setSecondDropdown(bool val) {
    isSecondDropDownOpen = val;
    notifyListeners();
  }

  // Add these at the top of your widget
  final GlobalKey firstDropdownKey = GlobalKey();
  final GlobalKey secondDropdownKey = GlobalKey();

  // Add this method
  void scrollToDropdown(GlobalKey key, BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  ///
  ///.  first drop down Ui logic
  ///
  String _selectedLevel = 'Selecciona tu nivel';
  String get selectedLevel => _selectedLevel;

  void setSelectedLevel(String newLevel) {
    _selectedLevel = newLevel;
    notifyListeners();
  }

  ///
  ///.  second drop down Ui logic
  ///
  String _selectedSecondLevel = 'Selecciona tu nivel';
  String get selectedSecondLevel => _selectedSecondLevel;

  void setSelectedSecondLevel(String newLevel) {
    _selectedSecondLevel = newLevel;
    notifyListeners();
  }
}
