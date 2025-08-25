// ignore_for_file: strict_top_level_inference, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/enums/user_roles.dart';
import 'package:talenty_app/core/enums/view_state.dart';
import 'package:talenty_app/core/model/app_user.dart';
import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/core/services/auth_services.dart';
import 'package:talenty_app/locator.dart';
import 'package:talenty_app/ui/custom_widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_root/candidate_root_screen.dart';
import 'package:talenty_app/ui/screens/company/root/root_screen.dart';

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

  final authServices = locator<AuthService>();
  AppUser appUser = AppUser();

  // UI state
  bool _isCandidate;
  bool get isCandidate => _isCandidate;

  bool _isHidden = true;
  bool get isHidden => _isHidden;

  // toggle candidate vs recruiter
  void setIsCandidate(bool bool) {
    _isCandidate = bool;
    // ✅ direct enum assign
    appUser.role = _isCandidate ? UserRole.candidate : UserRole.recruiter;
    notifyListeners();
  }

  // toggle password visibility
  void toggleHidden() {
    _isHidden = !_isHidden;
    notifyListeners();
  }

  // Google Sign-In method
  Future<void> loginWithGoogle(BuildContext context) async {
    setState(ViewState.busy);
    try {
      // Set the role before Google login
      final UserRole selectedRole =
          _isCandidate ? UserRole.candidate : UserRole.recruiter;

      final result = await authServices.loginWithGoogle(selectedRole);

      if (result.status == true && result.user != null) {
        // Successfully logged in with Google
        if (result.user!.role == UserRole.candidate) {
          Get.offAll(() => CandidateRootScreen());
          CustomSnackbar.show(
            title: "Success",
            message: "Google Sign-In successful as Candidate",
            textColor: whiteColor,
          );
        } else {
          Get.offAll(() => RootScreen());
          CustomSnackbar.show(
            title: "Success",
            message: "Google Sign-In successful as Recruiter",
            textColor: whiteColor,
          );
        }
      } else {
        CustomSnackbar.show(
          title: "Error",
          message: result.errorMessage ?? "Google Sign-In failed",
          textColor: whiteColor,
        );
      }
    } catch (e) {
      print("Google Sign-In error: $e");
      CustomSnackbar.show(
        title: "Error",
        message: "Google Sign-In failed, please try again",
        textColor: whiteColor,
      );
    } finally {
      setState(ViewState.idle);
    }
  }

  // login method
  loginUser(BuildContext context) async {
    setState(ViewState.busy);
    try {
      appUser.role = _isCandidate ? UserRole.candidate : UserRole.recruiter;

      final result = await authServices.loginUser(appUser);
      print('@LoginViewModel==> ${result.success}');
      if (result.success == true) {
        if (appUser.role == UserRole.candidate) {
          Get.to(() => CandidateRootScreen());
          CustomSnackbar.show(
            title: "Success",
            message: "Candidate login successful",
            textColor: whiteColor,
          );
        } else {
          Get.to(() => RootScreen());
          CustomSnackbar.show(
            title: "Success",
            message: "Recruiter login successful",
            textColor: whiteColor,
          );
        }
        print("Login Success: ${result.token}");
      } else {
        CustomSnackbar.show(
          title: "Error",
          message: result.message ?? "Invalid email or password",
          textColor: whiteColor,
        );
      }
    } catch (e) {
      print("Login error: $e");
      CustomSnackbar.show(
        title: "Error",
        message: "Something went wrong, please try again",
        textColor: whiteColor,
      );
    } finally {
      setState(ViewState.idle);
    }
  }

  // form validation helper
  final emailRegEx = RegExp(
    r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    caseSensitive: false,
  );

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
