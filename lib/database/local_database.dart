import 'package:shared_preferences/shared_preferences.dart';

class LocalDataBase {
  static Future setFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is-first-time', false);
  }

  static Future<bool> getFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('is-first-time') ?? true;
    return isFirstTime;
  }
}
