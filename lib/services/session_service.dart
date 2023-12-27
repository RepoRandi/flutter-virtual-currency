import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  Future<void> saveSession(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getSession(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> isLoggedIn() async {
    String? storedCookie = await getSession('cookie');
    return storedCookie != null;
  }
}
