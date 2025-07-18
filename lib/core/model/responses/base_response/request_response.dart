class RequestResponse<T> {
  bool success;
  String? message;
  String? error;
  T? data;

  RequestResponse(this.success, {this.message, this.error, this.data});

  factory RequestResponse.fromJson(Map<String, dynamic> json) {
    return RequestResponse(
      json['success'] ?? false,
      message: json['message'],
      error: json['error'],
      data: json['body'], // Keep this as-is for now
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'error': error,
      'body': data,
    };
  }
}
