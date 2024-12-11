import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Save credentials (signup functionality)
  Future<void> saveCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  // Retrieve credentials (login functionality)
  Future<Map<String, String>?> getCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final password = prefs.getString('password');

    if (username != null && password != null) {
      return {'username': username, 'password': password};
    }
    return null; // No credentials found
  }

  // Clear credentials (optional: for logout functionality)
  Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
