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
