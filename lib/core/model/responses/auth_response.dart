// ignore_for_file: annotate_overrides, overridden_fields, use_super_parameters

import 'package:talenty_app/core/model/app_user.dart';
import 'package:talenty_app/core/model/responses/base_response/base_response.dart';

class AuthResponse extends BaseResponse {
  AppUser? user;
  String? token;

  AuthResponse(bool success, {String? message, this.user, this.token})
    : super(success, message: message);

  AuthResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    // Parse the token from the body
    if (json['body'] != null && json['body'] is Map<String, dynamic>) {
      final body = json['body'] as Map<String, dynamic>;
      token = body['token'];

      // Create user from body data
      user = AppUser.fromJson(body);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['token'] = token;
    data['user'] = user?.toJson();
    return data;
  }
}
