class AppUser {
  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? role;
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
      role: json['role']?.toString(),
      otp: json['otp']?.toString(),
    );
  }

  /// Convert AppUser to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'role': role,
      'otp': otp,
    };
  }
}
