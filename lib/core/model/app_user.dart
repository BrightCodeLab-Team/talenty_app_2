class AppUser {
  final String name;
  final String email;
  final String password;
  final String role;
  final String? otp;

  AppUser({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    this.otp,
  });

  /// Convert JSON to AppUser
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      otp: json['otp'],
    );
  }

  /// Convert AppUser to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'otp': otp,
    };
  }
}
