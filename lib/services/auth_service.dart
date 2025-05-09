import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const _usernameKey = 'username';
  static const _passwordKey = 'password';

  Future<void> saveCrendentials(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
    await prefs.setString(_passwordKey, password);
  }

  Future<bool> login(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString(_usernameKey);
    String? storedPassword = prefs.getString(_passwordKey);

    return storedUsername == username && storedPassword == password;
  }
}
