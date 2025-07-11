// ignore_for_file: body_might_complete_normally_catch_error

import 'package:dio/dio.dart' show Dio, LogInterceptor;
import 'package:flutter/material.dart';

import 'package:talenty_app/core/config/config.dart';
import 'package:talenty_app/core/model/responses/base_response/request_response.dart';
import 'package:talenty_app/core/services/local_storage_services.dart';
import 'package:talenty_app/locator.dart';

class ApiServices {
  final _config = locator<Config>();
  Future<Dio> launchDio() async {
    String? accessToken = locator<LocalStorageService>().accessToken;
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // dio.interceptors.add(
    //     DioCacheManager(CacheConfig(baseUrl: EndPoint.baseUrl)).interceptor);
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.headers["Authorization"] = 'Bearer $accessToken';

    dio.options.followRedirects = false;
    dio.options.validateStatus = (s) {
      if (s != null) {
        return s < 500;
      } else {
        return false;
      }
    };
    return dio;
  }

  get({required String endPoint, params}) async {
    Dio dio = await launchDio();
    final response = await dio
        .get('${_config.baseUrl}/$endPoint', queryParameters: params)
        .catchError((e) {
          debugPrint('Unexpected Error');
        });
    if (response.statusCode == 200) {
      return RequestResponse.fromJson(response.data);
    } else if (response.statusCode == 500) {
      return RequestResponse(false, error: 'Server Error');
    } else {
      return RequestResponse(false, error: 'Network Error');
    }
  }

  post({required String endPoint, data}) async {
    Dio dio = await launchDio();
    final response = await dio
        .post('${_config.baseUrl}/$endPoint', data: data)
        .catchError((e) {
          debugPrint('Unexpected Error');
        });
    if (response.statusCode == 200) {
      return RequestResponse.fromJson(response.data);
    } else if (response.statusCode == 500) {
      return RequestResponse(false, error: 'Server Error');
    } else {
      return RequestResponse(false, error: 'Network Error');
    }
  }

  put({required String endPoint, data}) async {
    Dio dio = await launchDio();
    final response = await dio
        .put('${_config.baseUrl}/$endPoint', data: data)
        .catchError((e) {
          debugPrint('Unexpected Error');
        });
    if (response.statusCode == 200) {
      return RequestResponse.fromJson(response.data);
    } else if (response.statusCode == 500) {
      return RequestResponse(false, error: 'Server Error');
    } else {
      return RequestResponse(false, error: 'Network Error');
    }
  }

  delete({required String endPoint, params}) async {
    Dio dio = await launchDio();
    final response = await dio
        .delete('${_config.baseUrl}/$endPoint', queryParameters: params)
        .catchError((e) {
          debugPrint('Unexpected Error');
        });
    if (response.statusCode == 200) {
      return RequestResponse.fromJson(response.data);
    } else if (response.statusCode == 500) {
      return RequestResponse(false, error: 'Server Error');
    } else {
      return RequestResponse(false, error: 'Network Error');
    }
  }
}
