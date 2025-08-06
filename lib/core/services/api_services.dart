// ignore_for_file: unnecessary_string_interpolations, strict_top_level_inference, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talenty_app/core/model/responses/base_response/request_response.dart';
import 'package:talenty_app/core/services/local_storage_services.dart';
import 'package:talenty_app/locator.dart';

class ApiService {
  Future<Dio> launchDio() async {
    debugPrint('===== Access Token =====');
    String? accessToken = locator<LocalStorageService>().accessToken;
    debugPrint('Access Token Api Service ==> $accessToken');

    Dio dio = new Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // dio.interceptors.add(
    //     DioCacheManager(CacheConfig(baseUrl: EndPoint.baseUrl)).interceptor);
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.headers["Authorization"] = 'Bearer $accessToken';

    dio.options.followRedirects = false;
    dio.options.validateStatus = (s) {
      if (s != null)
        return s < 500;
      else
        return false;
    };
    return dio;
  }

  get({required String url, params}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio
          .get('$url', queryParameters: params)
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
    } catch (e) {
      debugPrint("@getApiException: $e");
      return RequestResponse(false, error: 'Server Error');
    }
  }

  post({required String url, data, params}) async {
    print("Post Request======>");
    Dio dio = await launchDio();

    try {
      final response = await dio
          .post('$url', data: data, queryParameters: params)
          .catchError((e) {
            print('Unexpected Error');
          });
      print('@ApiService Response ==> ${response.data.toString()}');
      debugPrint('Response ==> ${response.data.toString()}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else if (response.statusCode == 400) {
        return RequestResponse.fromJson(response.data);
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      debugPrint("@postApiException: $e");
      return RequestResponse(false, error: 'Server Error');
    }
  }

  put({required String url, data}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.put('$url', data: data).catchError((e) {
        debugPrint('Unexpected Error');
      });
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      debugPrint("@updateApiException: $e");
      return RequestResponse(false, error: 'Server Error');
    }
  }

  delete({required String url, params}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio
          .delete('$url', queryParameters: params)
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
    } catch (e) {
      debugPrint("@deleteApiException: $e");
      return RequestResponse(false, error: 'Server Error');
    }
  }
}
