import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static String loginStatusKey = "LOGIN_STATUS";
  static String userNameKey = "USERNAME";
  static String emailKey = "EMAIL";

  static Future saveUserDataInSharedPref(
      bool loginStatus, String userName, String email) async {
    print("saving values");
    final _sharedPref = await SharedPreferences.getInstance();
    _sharedPref.setBool(loginStatusKey, true);
    _sharedPref.setString(userNameKey, userName);
    _sharedPref.setString(emailKey, email);
  }

  Future<bool> checkUserLoginStatus() async {
    final _sharedPref = await SharedPreferences.getInstance();
    final loggedIn = _sharedPref.getBool(loginStatusKey);
    if (loggedIn == true) {
      print("logged in returning true");
      return true;
    } else {
      print("not logged in returning false");
      return false;
    }
  }
}
