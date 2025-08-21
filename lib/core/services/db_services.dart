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

  Future<AuthResponse> login(AppUser user) async {
    final RequestResponse response = await _apiServices.post(
      url: "${EndPoints.baseUrl}${EndPoints.login}",
      data: user.toLoginJson(),
    );

    print("@Login raw response: ${response.toJson()}");

    // Convert RequestResponse to AuthResponse
    return AuthResponse.fromJson(response.toJson());
  }

  Future<bool> checkUser(AppUser user) async {
    try {
      final RequestResponse response = await _apiServices.get(
        url: "${EndPoints.baseUrl}${EndPoints.getUserById}/${user.id}",
      );

      print("@CheckUser raw response: ${response.toJson()}");

      // Assuming your API returns a boolean or has a success field
      // Adjust this based on your actual API response structure
      return response.success ?? false;
    } catch (e) {
      print("Error checking user: $e");
      return false;
    }
  }

  Future<AuthResponse> getUserById(String userId) async {
    final RequestResponse response = await _apiServices.get(
      url: "${EndPoints.baseUrl}${EndPoints.getUserById}/$userId",
    );

    print("@GetUserById raw response: ${response.toJson()}");

    return AuthResponse.fromJson(response.toJson());
  }

  Future<AuthResponse> getUserProfile() async {
    RequestResponse response = await _apiServices.get(
      url: "${EndPoints.baseUrl}${EndPoints.userProfile}",
    );
    return AuthResponse.fromJson(response.body);
  }
}
