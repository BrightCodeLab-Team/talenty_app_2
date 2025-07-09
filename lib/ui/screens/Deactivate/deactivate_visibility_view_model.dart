import 'package:flutter/material.dart';

class DeactivateVisibilityViewModel extends ChangeNotifier {
  bool isVisible = false;

  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }
}