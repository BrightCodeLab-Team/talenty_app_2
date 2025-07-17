// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:talenty_app/core/config/config.dart';
import 'package:talenty_app/core/model/responses/base_response/request_response.dart';
import 'package:talenty_app/core/services/local_storage_services.dart';
import 'package:talenty_app/locator.dart';

class ApiServices {
  final _config = locator<Config>();

  Future<Dio> _launchDio() async {
    final String? accessToken = locator<LocalStorageService>().accessToken;
    final dio = Dio();

    dio.options
      ..baseUrl = _config.baseUrl
      ..headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (accessToken != null) 'Authorization': 'Bearer $accessToken',
      }
      ..followRedirects = false
      ..validateStatus = (status) => status != null && status < 500;

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }

  Future<RequestResponse> get({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    try {
      final dio = await _launchDio();
      final response = await dio.get(endPoint, queryParameters: params);
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<RequestResponse> post({required String endPoint, dynamic data}) async {
    try {
      final dio = await _launchDio();
      print('Making POST request to: ${dio.options.baseUrl}');
      final response = await dio.post(endPoint, data: data);

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<RequestResponse> put({required String endPoint, dynamic data}) async {
    try {
      final dio = await _launchDio();
      final response = await dio.put(endPoint, data: data);
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<RequestResponse> delete({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    try {
      final dio = await _launchDio();
      final response = await dio.delete(endPoint, queryParameters: params);
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  RequestResponse _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return RequestResponse.fromJson(response.data);
    } else {
      return RequestResponse(
        false,
        error: response.statusMessage ?? 'Unknown error',
      );
    }
  }

  RequestResponse _handleError(dynamic error) {
    if (error is DioError) {
      if (error.error is SocketException) {
        return RequestResponse(false, error: "No internet connection.");
      } else {
        return RequestResponse(false, error: error.message);
      }
    } else {
      return RequestResponse(false, error: "Unexpected error occurred.");
    }
  }
}
