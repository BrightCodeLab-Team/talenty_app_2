import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class RegisterViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RegisterViewModel() {
    init();
  }

  init() {
    emailController.addListener(_onFieldChanged);
    passwordController.addListener(_onFieldChanged);
    confirmPasswordController.addListener(_onFieldChanged);
  }

  bool emailErrorFlag = false;
  bool passwordErrorFlag = false;
  bool confirmPasswordErrorFlag = false;

  void _onFieldChanged() {
    if (emailErrorFlag && validateEmail() == null) {
      emailErrorFlag = false;
    }
    if (passwordErrorFlag && validatePassword() == null) {
      passwordErrorFlag = false;
    }
    if (confirmPasswordErrorFlag && validateConfirmPassword() == null) {
      confirmPasswordErrorFlag = false;
    }
    notifyListeners();
  }

  void validateFormFields() {
    emailErrorFlag = true;
    passwordErrorFlag = true;
    confirmPasswordErrorFlag = true;

    // Trigger the validators
    formKey.currentState?.validate();

    notifyListeners();
  }

  String? validateEmail() {
    final email = emailController.text.trim();
    if (email.isEmpty) return 'enterValidEmail'.tr;
    if (!_emailRegEx.hasMatch(email)) return 'invalidEmail'.tr;
    return null;
  }

  String? validatePassword() {
    final password = passwordController.text;
    if (password.isEmpty) return 'enterValidPassword'.tr;
    if (!_securePasswordRegEx.hasMatch(password)) return 'invalidPassword'.tr;
    return null;
  }

  String? validateConfirmPassword() {
    final confirm = confirmPasswordController.text;
    if (confirm.isEmpty) return 'enterValidConfirmPassword'.tr;
    if (confirm != passwordController.text) return 'passwordsDoNotMatch'.tr;
    return null;
  }

  bool get canSubmitReg =>
      validateEmail() == null &&
      validatePassword() == null &&
      validateConfirmPassword() == null;

  final _emailRegEx = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$');

  String? get emailError => emailErrorFlag ? validateEmail() : null;

  final _securePasswordRegEx = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W).{8,}$',
  );

  String? get passwordError => passwordErrorFlag ? validatePassword() : null;

  String? get confirmError =>
      confirmPasswordErrorFlag ? validateConfirmPassword() : null;

  bool get isEmailValid =>
      validateEmail() == null && emailController.text.isNotEmpty;

  bool get isPasswordValid =>
      validatePassword() == null && passwordController.text.isNotEmpty;

  bool get isConfirmValid =>
      validateConfirmPassword() == null &&
      confirmPasswordController.text.isNotEmpty;

  bool get canSubmit => isEmailValid && isPasswordValid && isConfirmValid;

  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;

  void toggleHidden() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  bool _isConfirmPasswordHidden = true;
  bool get isConfirmPasswordHidden => _isConfirmPasswordHidden;

  void toggleConfirmPasswordHidden() {
    _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
