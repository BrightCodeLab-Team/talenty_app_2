import 'package:talenty_app/core/enums/user_roles.dart';

class AppUser {
  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  UserRole? role; // yahan enum rakhenge
  String? otp;

  AppUser({
    this.id,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.role,
    this.otp,
  });

  /// Create AppUser from JSON
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id']?.toString(),
      name: json['name']?.toString(),
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      confirmPassword: json['confirmPassword']?.toString(),
      role: _stringToUserRole(json['role']?.toString()), // ✅ string → enum
      otp: json['otp']?.toString(),
    );
  }
  Map<String, dynamic> toLoginJson() {
    return {
      'email': email,
      'password': password,
      'role': role?.name, // or role.toString() depending on your enum
    };
  }

  /// Convert AppUser to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'role': role?.name, // ✅ enum → string
      'otp': otp,
    };
  }

  /// Helper function: String → UserRole
  static UserRole? _stringToUserRole(String? role) {
    if (role == null) return null;
    return UserRole.values.firstWhere(
      (e) => e.name == role,
      orElse: () => UserRole.candidate, // default
    );
  }
}
