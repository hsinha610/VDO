import 'package:shared_preferences/shared_preferences.dart';

bool isloggedIn;
String loggedInUser;

class Preference {
  static SharedPreferences _preferences;
  static const _loggedInKey = 'loggedinkey';
  static const _loggedInUserKey = 'loggedinuserkey';
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool getLoggedIn() {
    return _preferences.getBool(_loggedInKey);
  }

  static Future setLoggedIn(bool b) async {
    await _preferences.setBool(_loggedInKey, b);
  }

  static String getLoggedInUser() {
    return _preferences.getString(_loggedInUserKey);
  }

  static Future setLoggedInUser(String s) async {
    await _preferences.setString(_loggedInUserKey, s);
  }
}
