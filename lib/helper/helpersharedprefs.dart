import 'package:shared_preferences/shared_preferences.dart';

class HelperSharedPrefs {
  static const String cIsLogin = "isLoggedIn";
  static const String cLoginRole = "loginRole";
  static const String cLoginId = "loginId";
  static const String cLoginName = "loginName";
  static const String cLoginEmail = "loginEmail";
  static const String cLoginTelp = "loginTelp";
  Future<bool> getIsLogin() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(cIsLogin) ?? false;
    }catch(e) {
      return false;
    }
  }

  logout() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove(cIsLogin);
        prefs.remove(cLoginRole);
        prefs.remove(cLoginId);
        prefs.remove(cLoginName);
        prefs.remove(cLoginEmail);
        prefs.remove(cLoginTelp);
    }catch(e) {
      return false;
    }
  }
}