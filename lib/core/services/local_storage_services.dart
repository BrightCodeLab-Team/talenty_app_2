import 'package:shared_preferences/shared_preferences.dart';
import 'package:talenty_app/core/others/logger_customization/custom_logger.dart';

class LocalStorageService {
  final log = CustomLogger(className: 'Local Storage Service');
  static SharedPreferences? _preferences;

  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';
  static const String userIdKey = 'userId';
  static const String userRoleKey =
      'userRole'; // ✅ Optional for candidate/recruiter

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // ✅ Access Token
  String? get accessToken => _getFromDisk(accessTokenKey);
  Future<void> setAccessToken(String token) async =>
      _saveToDisk(accessTokenKey, token);

  set accessToken(String? token) {
    if (token == null) {
      _preferences?.remove(accessTokenKey);
      log.d("Access token removed");
    } else {
      _preferences?.setString(accessTokenKey, token);
      log.d("Access token saved: $token");
    }
  }

  // ✅ Refresh Token
  String? get refreshToken => _getFromDisk(refreshTokenKey);
  Future<void> setRefreshToken(String token) async =>
      _saveToDisk(refreshTokenKey, token);

  // ✅ User ID
  String? get userId => _getFromDisk(userIdKey);
  Future<void> setUserId(String id) async => _saveToDisk(userIdKey, id);

  // ✅ User Role (Candidate / Recruiter)
  String? get userRole => _getFromDisk(userRoleKey);
  Future<void> setUserRole(String role) async => _saveToDisk(userRoleKey, role);

  // --- Internal helpers ---
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
    }
  }
}
