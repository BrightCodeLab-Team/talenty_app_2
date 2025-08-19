// ignore_for_file: unused_field
import 'package:logger/logger.dart';
import 'package:talenty_app/core/model/app_user.dart';
import 'package:talenty_app/core/model/otp_model.dart';
import 'package:talenty_app/core/model/responses/auth_response.dart';
import 'package:talenty_app/core/model/responses/otp_response.dart';
import 'package:talenty_app/core/others/logger_customization/custom_logger.dart';
import 'package:talenty_app/core/services/db_services.dart';
import 'package:talenty_app/core/services/local_storage_services.dart';
import 'package:talenty_app/locator.dart';

///
/// [AuthService] class contains all authentication related logic with following
/// methods:
///
/// [doSetup]: This method contains all the initial authentication like checking
/// login status, onboarding status and other related initial app flow setup.
///
/// [signupWithEmailAndPassword]: This method is used for signup with email and password.
///
/// [signupWithApple]:
///
/// [signupWithGmail]:
///
/// [signupWithFacebook]:
///
/// [logout]:
///

class AuthService {
  late bool isLogin;
  final _localStorageService = locator<LocalStorageService>();
  final _dbService = locator<DatabaseService>();
  // UserProfile? userProfile;
  String? fcmToken;
  static final Logger log = CustomLogger(className: 'AuthService');

  ///
  /// [doSetup] Function does the following things:
  ///   1) Checks if the user is logged then:
  ///       a) Get the user profile data
  ///       b) Updates the user FCM Token
  ///
  doSetup() async {
    isLogin = _localStorageService.accessToken != null;
    if (isLogin) {
      log.d('User is already logged-in');
      // await _getUserProfile();
      // await _updateFcmToken();
    } else {
      log.d('@doSetup: User is not logged-in');
    }
  }

  Future<AuthResponse> createUser(AppUser user) async {
    print("@AuthResponse  ${user.toJson()}");
    final response = await _dbService.createUserAccount(user);
    if (response.success) {
      // _localStorageService. = response.message;
      print("Sucess ==> ${response.toJson()}");
    }
    print("@AuthResponse 2 ${response.toString()}");
    return response;
  }

  Future<OtpResponse> verifyOtp(OtpModel otpModel) async {
    final otpResponse = await _dbService.verifyOtp(otpModel);

    if (otpResponse.success && otpResponse.token != null) {
      await _localStorageService.setAccessToken(otpResponse.token!);
      print("OTP verified, token saved! ${_localStorageService.accessToken}");
    }
    return otpResponse;
  }

  Future<AuthResponse> loginUser(AppUser user) async {
    final response = await _dbService.login(user);
    if (response.success && response.token != null) {
      await _localStorageService.setAccessToken(response.token!);
      print("Login Success, token saved: ${response.token}");
    } else {
      print("Login Failed: ${response.message}");
    }

    return response;
  }

  logout() async {
    isLogin = false;
    // userProfile = null;
    // await _dbService.clearFcmToken(await DeviceInfoService().getDeviceId());
    // _localStorageService. = null;
  }
}
