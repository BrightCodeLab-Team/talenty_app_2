// shared_visibility_viewmodel.dart
import 'package:flutter/material.dart';

class SharedVisibilityViewModel extends ChangeNotifier {
  bool _isVisible = true;
  bool _isAvailable = true;

  bool get isVisible => _isVisible;
  bool get isAvailable => _isAvailable;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    if (!_isVisible) {
      _isAvailable = false;
    }
    notifyListeners();
  }

  void toggleAvailability() {
    _isAvailable = !_isAvailable;
    if (_isAvailable) {
      _isVisible = true;
    }
    notifyListeners();
  }

  void setVisibility(bool value) {
    _isVisible = value;
    if (!value) {
      _isAvailable = false;
    }
    notifyListeners();
  }

  void setAvailability(bool value) {
    _isAvailable = value;
    if (value) {
      _isVisible = true;
    }
    notifyListeners();
  }
}
