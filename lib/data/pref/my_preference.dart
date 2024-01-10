import 'package:shared_preferences/shared_preferences.dart';

class MyPreference {
  static late final SharedPreferences _pref;

  static void init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static void setLang(String lang) {
    _pref.setString("lang", lang);
  }

  static String? getLang(){
    return _pref.getString("lang");
  }
}