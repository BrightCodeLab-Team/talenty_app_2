// ignore_for_file: unused_field, strict_top_level_inference
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:talenty_app/core/enums/user_roles.dart';
import 'package:talenty_app/core/model/app_user.dart';
import 'package:talenty_app/core/model/custom_auth/custom_auth_result.dart';
import 'package:talenty_app/core/model/otp_model.dart';
import 'package:talenty_app/core/model/responses/auth_response.dart';
import 'package:talenty_app/core/model/responses/otp_response.dart';
import 'package:talenty_app/core/others/logger_customization/custom_logger.dart';
import 'package:talenty_app/core/services/db_services.dart';
import 'package:talenty_app/core/services/local_storage_services.dart';
import 'package:talenty_app/locator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  late bool isLogin;
  final _localStorageService = locator<LocalStorageService>();
  final _dbService = locator<DatabaseService>();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AppUser? appUser;
  String? fcmToken;

  static final Logger log = CustomLogger(className: 'AuthService');

  /// ✅ Setup method for checking login status & loading user profile
  doSetup() async {
    isLogin = _localStorageService.accessToken != null;
    if (isLogin) {
      log.d('User is already logged-in');

      // ✅ role bhi check karo
      String? role = _localStorageService.userRole;
      String? userId =
          _localStorageService.userId; // 👈 Local storage se userId nikalo

      if (role != null && userId != null) {
        // await getAppUser(userId); // 👈 Ab String pass hoga
        log.d("User role found: $role");
      } else {
        log.d("⚠️ Role ya UserId missing in local storage");
      }
    } else {
      log.d('@doSetup: User is not logged-in');
    }
  }

  /// ✅ Fetch user profile from DB
  Future<void> getAppUser(String userId) async {
    // 👈 idhar String accept karo
    AuthResponse response = await _dbService.getUserById(userId);
    if (response.success) {
      appUser = response.user;

      print("User Profile==============>${appUser!.toJson()}");
      isLogin = true;
    } else {
      _localStorageService.accessToken = null;
      isLogin = false;
      debugPrint("User login failed: $isLogin");
    }
  }

  ///
  /// ✅ Create Account
  ///
  Future<AuthResponse> createUser(AppUser user) async {
    print("@AuthResponse  ${user.toJson()}");
    final response = await _dbService.createUserAccount(user);
    if (response.success) {
      print("Success ==> ${response.toJson()}");
    }
    print("@AuthResponse 2 ${response.toString()}");
    return response;
  }

  ///
  /// ✅ Verify Otp
  ///
  Future<OtpResponse> verifyOtp(OtpModel otpModel) async {
    final otpResponse = await _dbService.verifyOtp(otpModel);
    if (otpResponse.success && otpResponse.token != null) {
      await _localStorageService.setAccessToken(otpResponse.token!);
      print("OTP verified, token saved! ${_localStorageService.accessToken}");
    }
    return otpResponse;
  }

  ///
  /// ✅ Login User
  ///
  Future<AuthResponse> loginUser(AppUser user) async {
    final response = await _dbService.login(user);
    if (response.success && response.token != null && response.user != null) {
      // ✅ Save Access Token
      await _localStorageService.setAccessToken(response.token!);

      // ✅ Save User Id
      await _localStorageService.setUserId(response.user!.id!);

      // ✅ Save User Role
      await _localStorageService.setUserRole(response.user!.role!.name);

      print(
        "Login Success, token, userId & role saved: "
        "${response.token} | ${response.user!.id} | ${response.user!.role!.name}",
      );
    } else {
      print("Login Failed: ${response.message}");
    }
    return response;
  }

  ///
  /// ✅ Login with Google
  ///
  Future<CustomAuthResult> loginWithGoogle(UserRole role) async {
    CustomAuthResult customAuthResult = CustomAuthResult();
    try {
      await _googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        customAuthResult.errorMessage = "Google sign-in aborted.";
        return customAuthResult;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult = await _auth.signInWithCredential(
        credential,
      );

      appUser = AppUser(
        id: authResult.user!.uid,
        email: authResult.user!.email ?? '',
        name: authResult.user!.displayName ?? '',
        role: role,
      );

      isLogin = true;

      // ✅ DB check
      bool isUserExist = await _dbService.checkUser(appUser!);
      AuthResponse? authResponse;

      if (isUserExist) {
        authResponse = await _dbService.getUserById(appUser!.id!);
        if (authResponse.success && authResponse.user != null) {
          appUser = authResponse.user;
        }
      } else {
        authResponse = await _dbService.createUserAccount(appUser!);
      }

      // ✅ Save token if available
      if (authResponse != null &&
          authResponse.token != null &&
          authResponse.user != null) {
        await _localStorageService.setAccessToken(authResponse.token!);
        await _localStorageService.setUserId(authResponse.user!.id!);
        await _localStorageService.setUserRole(authResponse.user!.role!.name);

        print(
          "Google Login Success, token, userId & role saved: "
          "${authResponse.token} | ${authResponse.user!.id} | ${authResponse.user!.role!.name}",
        );
      }

      customAuthResult.status = true;
      customAuthResult.user = appUser;
    } catch (e) {
      customAuthResult.status = false;
      customAuthResult.errorMessage = _generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  // Helper method to generate exception messages
  String _generateExceptionMessage(dynamic e) {
    if (e is FirebaseAuthException) {
      return e.message ?? 'Firebase authentication error';
    } else {
      return e.toString();
    }
  }

  logout() async {
    isLogin = false;
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
