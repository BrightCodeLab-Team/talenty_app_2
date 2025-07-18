// ignore_for_file: unused_field

import 'package:talenty_app/core/constants/end_point.dart';
import 'package:talenty_app/core/model/app_user.dart';
import 'package:talenty_app/core/model/otp_model.dart';
import 'package:talenty_app/core/model/responses/auth_response.dart';
import 'package:talenty_app/core/model/responses/base_response/request_response.dart';
import 'package:talenty_app/core/model/responses/otp_response.dart';
import 'package:talenty_app/core/services/api_services.dart';
import 'package:talenty_app/locator.dart';

class DatabaseService {
  final ApiService _apiServices = locator<ApiService>();

  Future<AuthResponse> createUserAccount(AppUser user) async {
    print("@AuthResponse  ${user.toJson()}");

    final RequestResponse response = await _apiServices.post(
      url: "${EndPoints.baseUrl}${EndPoints.registerUser}",
      data: user.toJson(),
    );

    print("@AuthResponse raw response: ${response.toJson()}");

    // Convert RequestResponse to AuthResponse manually
    final authResponse = AuthResponse.fromJson(response.toJson());

    return authResponse;
  }

  Future<OtpResponse> verifyOtp(OtpModel otpModel) async {
    final response = await _apiServices.post(
      url: "${EndPoints.baseUrl}${EndPoints.verifyotp}",
      data: otpModel,
    );

    return OtpResponse.fromJson(response.toJson());
  }

  // Future<CreateUserResponse> getUserProfile() async {
  //   final CreateUserResponse response = await _apiServices.get(
  //     endPoint: EndPoints.userProfile,
  //   );
  //   return UserProfileResponse.fromJson(response.data);
  // }

  // Future<OnboardingResponse> getOnboardingData() async {
  //   final RequestResponse response = await _apiServices.get(
  //     endPoint: EndPoints.onboardingData,
  //   );
  //   return OnboardingResponse.fromJson(response.data);
  // }

  // Future<BaseResponse> updateFcmToken(String deviceId, String token) async {
  //   final RequestResponse response = await _apiServices.post(
  //     endPoint: EndPoints.fcmToken,
  //     data: {'device_id': deviceId, 'token': token},
  //   );
  //   return BaseResponse.fromJson(response.data);
  // }

  // Future<BaseResponse> clearFcmToken(String deviceId) async {
  //   final RequestResponse response = await _apiServices.post(
  //     endPoint: EndPoints.clearFcmToken,
  //     data: {'device_id': deviceId},
  //   );
  //   return BaseResponse.fromJson(response.data);
  // }

  // Future<AuthResponse> loginWithEmailAndPassword(LoginBody body) async {
  //   final RequestResponse response = await _apiServices.post(
  //     endPoint: EndPoints.login,
  //     data: body.toJson(),
  //   );
  //   return AuthResponse.fromJson(response.data);
  // }

  // Future<AuthResponse> createAccount(SignUpBody body) async {
  //   final RequestResponse response = await _apiServices.post(
  //     endPoint: EndPoints.signUp,
  //     data: body.toJson(),
  //   );
  //   return AuthResponse.fromJson(response.data);
  // }

  // Future<AuthResponse> resetPassword(ResetPasswordBody body) async {
  //   final RequestResponse response = await _apiServices.post(
  //     endPoint: EndPoints.resetPassword,
  //     data: body.toJson(),
  //   );
  //   return AuthResponse.fromJson(response.data);
  // }
}
