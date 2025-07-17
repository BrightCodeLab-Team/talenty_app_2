class RequestResponse {
  final bool success;
  final String? error;
  final String? message;
  final Map<String, dynamic>? data;

  RequestResponse(this.success, {this.error, this.message, this.data});

  factory RequestResponse.fromJson(Map<String, dynamic> json) {
    return RequestResponse(
      json['success'] ?? false,
      message: json['message'],
      error: json['error'], // some APIs send `error`, some `message`
      data: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'error': error,
      'message': message,
      'body': data,
    };
  }
}
