import 'package:graduated_project/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataBase {
  static Future setFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is-first-time', false);
  }

  static Future getFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isFirstTime = prefs.getBool('is-first-time') ?? true;
    return isFirstTime;
  }

  static Future setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return token;
  }

  static Future setID(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', id);
  }

  static Future getID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('id');
    return id;
  }

  static Future clearAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static void setUser(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList("user", [
      user.id.toString(),
      user.name,
      user.email,
    ]);
  }

  static Future getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 1));

    List<String>? us = pref.getStringList("user");
    User user = User(
      id: int.parse(us![0]),
      name: us[1],
      email: us[2],
    );
    return user;
  }
}
