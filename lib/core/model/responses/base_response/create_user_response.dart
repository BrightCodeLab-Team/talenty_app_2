import 'package:talenty_app/core/model/app_user.dart';

class CreateUserResponse {
  final bool success;
  final String? message;
  final AppUser? body;

  CreateUserResponse({required this.success, this.message, this.body});

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      success: json['success'] ?? false,
      message: json['message'],
      body: json['body'] != null ? AppUser.fromJson(json['body']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'body': body?.toJson()};
  }
}
