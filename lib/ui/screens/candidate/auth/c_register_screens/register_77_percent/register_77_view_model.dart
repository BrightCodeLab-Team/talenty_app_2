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
}
