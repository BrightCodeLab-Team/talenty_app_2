// ignore_for_file: strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/enums/view_state.dart';
import 'package:talenty_app/core/model/app_user.dart';
import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/core/services/auth_services.dart';
import 'package:talenty_app/core/services/db_services.dart';
import 'package:talenty_app/locator.dart';
import 'package:talenty_app/ui/screens/candidate/auth/otp/otp_screen.dart';

class CandidateSignUpViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final _authService = locator<AuthService>();
  final _db = locator<DatabaseService>();
  AppUser appUser = AppUser();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  CandidateSignUpViewModel() {
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
    if (emailErrorFlag && validateEmail() == null) emailErrorFlag = false;
    if (passwordErrorFlag && validatePassword() == null)
      passwordErrorFlag = false;
    if (confirmPasswordErrorFlag && validateConfirmPassword() == null)
      confirmPasswordErrorFlag = false;
    notifyListeners();
  }

  void validateFormFields() {
    emailErrorFlag = true;
    passwordErrorFlag = true;
    confirmPasswordErrorFlag = true;
    formKey.currentState?.validate();
    notifyListeners();
  }

  // ========== VALIDATION ==========

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

  final _emailRegEx = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$');
  final _securePasswordRegEx = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W).{8,}$',
  );

  // ========== GETTERS FOR UI ==========

  String? get emailError => emailErrorFlag ? validateEmail() : null;
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

  // ========== PASSWORD TOGGLE ==========

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

  // ========== REGISTER LOGIC ==========

  registerUser() async {
    validateFormFields();

    if (!canSubmit) return;

    setState(ViewState.busy);

    final response = await _authService.createUser(appUser);

    print("@SignUpViewModel RegisterViewModel==> ${response.toJson()}");

    if (response.success) {
      Get.to(() => CandidateOTPScreen(email: emailController.text));
      Get.snackbar(
        "Success",
        response.message ?? "Registration successful",
        snackPosition: SnackPosition.TOP,
      );
      // Navigate to OTP screen or home
    } else {
      print("signupviewmodel===>  messsage ${response.message}");
      Get.snackbar(
        "Error",
        response.message ?? "Something went wrong",
        snackPosition: SnackPosition.TOP,
      );
    }
    setState(ViewState.idle);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
