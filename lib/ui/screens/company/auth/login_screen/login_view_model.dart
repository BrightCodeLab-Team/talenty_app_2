import 'package:flutter/material.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel({required bool isCandidate}) : _isCandidate = isCandidate {
    // whenever the text changes, rebuild anything listening
    emailController.addListener(_onTextChanged);
    passwordController.addListener(_onTextChanged);
  }
  // form
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // UI state
  bool _isCandidate;
  bool get isCandidate => _isCandidate;

  bool _isHidden = true;
  bool get isHidden => _isHidden;

  // toggle candidate vs recruiter
  void setIsCandidate(bool bool) {
    _isCandidate = bool;
    notifyListeners();
  }

  // toggle password visibility
  void toggleHidden() {
    _isHidden = !_isHidden;
    notifyListeners();
  }

  // form validation helper
  final emailRegEx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  bool get _emailValid => emailRegEx.hasMatch(emailController.text);
  bool get _passwordValid => passwordController.text.trim().length >= 6;
  bool get canSubmit => _emailValid && _passwordValid;

  void _onTextChanged() => notifyListeners();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
