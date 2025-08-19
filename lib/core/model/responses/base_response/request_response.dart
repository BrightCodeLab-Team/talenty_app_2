// class RequestResponse<T> {
//   bool success;
//   String? message;
//   String? error;
//   T? data;

//   RequestResponse(this.success, {this.message, this.error, this.data});

//   factory RequestResponse.fromJson(Map<String, dynamic> json) {
//     return RequestResponse(
//       json['success'] ?? false,
//       message: json['message'],
//       error: json['error'],
//       data: json['body'], // Keep this as-is for now
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'success': success,
//       'message': message,
//       'error': error,
//       'body': data,
//     };
//   }
// }

class RequestResponse<T> {
  final bool success;
  final String? message;
  final String? error;
  final T? body;
  final int? statusCode; // Add status code field

  RequestResponse(
    this.success, {
    this.message,
    this.error,
    this.body,
    this.statusCode,
  });

  factory RequestResponse.fromJson(Map<String, dynamic> json) {
    return RequestResponse(
      json['success'],
      message: json['message'],
      error: json['error'],
      body: json['body'],
      statusCode: json['statusCode'], // Add this
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['error'] = error;
    data['body'] = body;
    data['statusCode'] = statusCode; // Add this
    return data;
  }
}
