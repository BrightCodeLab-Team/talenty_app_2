class OtpModel {
  int? id;
  String? email;
  String? otp;
  String? role;
  String? token;

  OtpModel({this.id, this.email, this.role, this.token, this.otp});

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      id: json['id'],
      email: json['email'],
      otp: json['otp'],
      role: json['role'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'role': role, 'token': token, 'otp': otp};
  }
}
