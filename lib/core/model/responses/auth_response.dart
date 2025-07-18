import 'package:talenty_app/core/model/app_user.dart';
import 'package:talenty_app/core/model/responses/base_response/base_response.dart';

class AuthResponse extends BaseResponse {
  AppUser user = AppUser();
  String? message = '';

  /// Default constructor
  AuthResponse(bool success, {String? error, this.message = ''})
    : super(success, message: error);

  /// Named constructor from JSON
  AuthResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    final body = json['body'];

    if (body != null && body is Map<String, dynamic>) {
      user = AppUser.fromJson(body);
    }
    message = json['message'] ?? '';
  }
}
