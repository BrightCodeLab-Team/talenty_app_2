// ignore_for_file: use_super_parameters

import 'package:talenty_app/core/model/responses/base_response/base_response.dart';

class AuthResponse extends BaseResponse {
  String? accessToken;

  /// Default constructor
  AuthResponse(success, {error, this.accessToken})
    : super(success, error: error);

  /// Named Constructor
  AuthResponse.fromJson(json) : super.fromJson(json) {
    if (json['body'] != null) accessToken = json['body']['token'];
  }
}
