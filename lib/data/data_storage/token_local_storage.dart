import 'package:shared_preferences/shared_preferences.dart';

const _token = 'bearer_token';

class TokenStorage {
  static late final SharedPreferences _tokenStorage;

  static Future<void> init() async {
    _tokenStorage = await SharedPreferences.getInstance();
  }

  static Future<void> storeToken(String token) async {
    await _tokenStorage.setString(_token, token);
  }

  static String retrieveToken() {
    return _tokenStorage.getString(_token) ?? '';
  }

  static clearToken() {
    _tokenStorage.clear();
  }
}

