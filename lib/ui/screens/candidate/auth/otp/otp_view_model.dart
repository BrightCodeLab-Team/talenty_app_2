import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/enums/view_state.dart';
import 'package:talenty_app/core/model/otp_model.dart';
import 'package:talenty_app/core/services/auth_services.dart';
import 'package:talenty_app/locator.dart';
import 'package:talenty_app/ui/screens/candidate/auth/build_Profile/mandatory_registeration/mandatory_student_registration.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_company/register_company_0_percent_screen.dart';

import '../../../../../core/others/base_view_model.dart';

class OtpViewModelCandidate extends BaseViewModel {
  final _auth = locator<AuthService>();

  OtpModel otpModel = OtpModel();
  List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  String otp = '';
  String? otpError;
  bool hasError = false;
  bool _canResend = false;
  bool get canResend => _canResend;

  // Timer
  late Timer _timer;
  int _remainingSeconds = 60;
  String get timerText {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  OtpViewModel() {
    startTimer();
  }

  void updateOtp(String pin) {
    otp = pin;
    otpError = null;
    hasError = false;
    notifyListeners();
  }

  void onOtpFieldChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(
        focusNodes[index].context!,
      ).requestFocus(focusNodes[index + 1]);
    }

    String code = controllers.map((e) => e.text).join();
    if (code.length == 6) {
      updateOtp(code);
    }
  }

  bool get isComplete => otp.length == 6;

  bool validateOtp() {
    if (otp.length != 6) {
      otpError = 'please_enter_6_digit_code'.tr;
      hasError = true;
      notifyListeners();
      return false;
    }
    otpError = null;
    hasError = false;
    notifyListeners();
    return true;
  }

  verify() async {
    setState(ViewState.busy);
    otpModel.otp = otp;
    print("otp email==> ${otpModel.email}");
    print("otp otp==> ${otpModel.otp}");
    final response = await _auth.verifyOtp(otpModel);
    if (response.success) {
      Get.snackbar("Success", "OTP Verified");
      Get.to(() => MandatoryStudentRegistration());
    } else {
      Get.snackbar("Error", response.message ?? "Something went wrong");
    }
    setState(ViewState.idle);
  }

  void startTimer() {
    _remainingSeconds = 60;
    _canResend = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
      } else {
        _canResend = true;
        _timer.cancel();
      }
      notifyListeners();
    });
  }

  void resendOtp() {
    otp = '';
    otpError = null;
    hasError = false;
    startTimer();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
