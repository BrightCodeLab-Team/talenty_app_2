// ignore_for_file: use_super_parameters

import 'package:talenty_app/core/model/responses/base_response/base_response.dart';

class OtpResponse extends BaseResponse {
  int? id;
  String? email;
  String? role;
  String? token;
  String? message;

  OtpResponse(bool success, {String? error, this.message})
    : super(success, message: error);

  OtpResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    final body = json['body'];

    if (body != null && body is Map<String, dynamic>) {
      id = body['id'];
      email = body['email'];
      role = body['role'];
      token = body['token'];
    }

    message = json['message'] ?? '';
  }
}
