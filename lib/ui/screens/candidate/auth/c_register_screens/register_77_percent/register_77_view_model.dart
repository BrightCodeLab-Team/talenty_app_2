
import 'package:flutter/material.dart';

class CandidateRegister77percentViewModel extends ChangeNotifier {
  String selectedLevel = 'Selecciona tu nivel';
  String selectedSecondLevel = 'Selecciona tu nivel';
  bool isFirstDropDownOpen = false;
  bool isSecondDropDownOpen = false;

  // New properties to handle multiple languages
  final Map<int, String> _languageLevels = {};
  final Map<int, bool> _dropdownStates = {};

  // Keys for dropdowns (if you need them)
  final GlobalKey firstDropdownKey = GlobalKey();
  final GlobalKey secondDropdownKey = GlobalKey();

  void setSelectedLevel(String level) {
    selectedLevel = level;
    notifyListeners();
  }

  void setSelectedSecondLevel(String level) {
    selectedSecondLevel = level;
    notifyListeners();
  }

  void setFirstDropdown(bool value) {
    isFirstDropDownOpen = value;
    notifyListeners();
  }

  void setSecondDropdown(bool value) {
    isSecondDropDownOpen = value;
    notifyListeners();
  }

  // New methods for handling multiple languages
  String getLanguageLevel(int index) {
    return _languageLevels[index] ?? 'Selecciona tu nivel';
  }

  void setLanguageLevel(int index, String level) {
    _languageLevels[index] = level;
    notifyListeners();
  }

  bool isLanguageDropdownOpen(int index) {
    return _dropdownStates[index] ?? false;
  }

  void setLanguageDropdownOpen(int index, bool isOpen) {
    _dropdownStates[index] = isOpen;
    notifyListeners();
  }

  // Method to check if all languages have a level selected
  bool areAllLevelsSelected(int totalLanguages) {
    for (int i = 0; i < totalLanguages; i++) {
      if (!_languageLevels.containsKey(i) ||
          _languageLevels[i] == 'Selecciona tu nivel') {
        return false;
      }
    }
    return true;
  }
}
