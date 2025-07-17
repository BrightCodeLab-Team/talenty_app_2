// ignore_for_file: unused_field

import 'package:logger/logger.dart';
import 'package:talenty_app/core/constants/end_point.dart';
import 'package:talenty_app/core/model/app_user.dart';
import 'package:talenty_app/core/model/responses/base_response/request_response.dart';
import 'package:talenty_app/core/others/logger_customization/custom_logger.dart';
import 'package:talenty_app/core/services/api_services.dart';
import 'package:talenty_app/core/services/db_services.dart';
import 'package:talenty_app/core/services/local_storage_services.dart';
import 'package:talenty_app/locator.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

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
  final _apiService = ApiServices();
  String? fcmToken;
  AppUser appUser = AppUser();
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

  Future<RequestResponse> register({required AppUser user}) async {
    try {
      final response = await _apiService.post(
        data: user.toJson(),
        endPoint: EndPoints.registerUser,
      );

      print("@AuthServices register ==> ${response.message.toString()}");

      if (response.success) {
        final userJson = response.data?['body'];
        final registeredUser = AppUser.fromJson(userJson);
        appUser = registeredUser;

        await _localStorageService.setUserId(registeredUser.id ?? '');
        await _localStorageService.setUser(registeredUser);

        isLogin = false;

        return RequestResponse(
          true,
          message: response.message,
          data: registeredUser.toJson(),
        );
      } else {
        return RequestResponse(
          false,
          error: response.message ?? response.error,
        );
      }
    } catch (e) {
      return RequestResponse(false, error: e.toString());
    }
  }

  // testHttpPost(email, password, confirmPassword) async {
  //   final url = Uri.parse(
  //     'http://localhost:3000/users/register',
  //   ); // Replace with your real API URL
  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //   };
  //   final body = jsonEncode({
  //     'email': "$email",
  //     'password': '$password',
  //     'confirmPassword': '$confirmPassword',
  //     'role': 'candidate',
  //   });

  //   try {
  //     final response = await http.post(url, headers: headers, body: body);

  //     print('Status code: ${response.statusCode}');
  //     print('Body: ${response.body}');
  //   } catch (e) {
  //     print('HTTP Error: $e');
  //   }
  // }

  signupWithApple() {}

  signupWithGmail() {}

  signupWithFacebook() {}

  logout() async {
    isLogin = false;
    // userProfile = null;
    // await _dbService.clearFcmToken(await DeviceInfoService().getDeviceId());
    _localStorageService.accessToken = null;
  }
}
