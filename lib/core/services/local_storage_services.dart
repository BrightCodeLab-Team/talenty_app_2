import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talenty_app/core/model/app_user.dart';
import 'package:talenty_app/core/others/logger_customization/custom_logger.dart';

class LocalStorageService {
  final log = CustomLogger(className: 'Local Storage Service');
  static SharedPreferences? _preferences;

  ///
  /// List of const keys
  ///
  static const String onboardingCountKey = 'onBoardingCount';
  static const String notificationsCountKey = 'notificationsCount';
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';
  static const String userIdKey = 'userId';
  static const String userKey = 'user';

  ///
  /// Init SharedPreferences instance
  ///
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  ///
  /// General Getters/Setters
  ///
  int get onBoardingPageCount => _getFromDisk(onboardingCountKey) ?? 0;
  set onBoardingPageCount(int count) => _saveToDisk(onboardingCountKey, count);

  int get setNotificationsCount => _getFromDisk(notificationsCountKey) ?? 0;
  set setNotificationsCount(int count) =>
      _saveToDisk(notificationsCountKey, count);

  dynamic get accessToken => _getFromDisk(accessTokenKey);
  set accessToken(token) => _saveToDisk(accessTokenKey, token);

  dynamic get refreshToken => _getFromDisk(refreshTokenKey);

  ///
  /// Save and get userId
  ///
  Future<void> setUserId(String userId) async {
    _saveToDisk(userIdKey, userId);
  }

  String? get userId => _getFromDisk(userIdKey);

  ///
  /// Save full AppUser as JSON
  ///
  Future<void> setUser(AppUser user) async {
    final userJson = jsonEncode(user.toJson());
    _saveToDisk(userKey, userJson);
  }

  AppUser? get getUser {
    final jsonString = _getFromDisk(userKey);
    if (jsonString != null && jsonString is String) {
      final jsonMap = jsonDecode(jsonString);
      return AppUser.fromJson(jsonMap);
    }
    return null;
  }

  ///
  /// Internal get/set methods
  ///
  dynamic _getFromDisk(String key) {
    final value = _preferences?.get(key);
    log.d('@_getFromDisk. key: $key value: $value');
    return value;
  }

  void _saveToDisk<T>(String key, T? content) {
    log.d('@_saveToDisk. key: $key value: $content');

    if (content == null) {
      _preferences?.remove(key);
      return;
    }

    if (content is String) {
      _preferences?.setString(key, content);
    } else if (content is bool) {
      _preferences?.setBool(key, content);
    } else if (content is int) {
      _preferences?.setInt(key, content);
    } else if (content is double) {
      _preferences?.setDouble(key, content);
    } else if (content is List<String>) {
      _preferences?.setStringList(key, content);
    }
  }
}
