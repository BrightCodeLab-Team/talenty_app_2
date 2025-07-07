import 'dart:async';

import 'package:get/get.dart';

import '../../../../../core/others/base_view_model.dart';

class OtpViewModel extends BaseViewModel {
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
