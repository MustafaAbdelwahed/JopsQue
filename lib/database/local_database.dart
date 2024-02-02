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

  static Future? getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print("//////////////////////////////////////////////////////fldmkfdkm//");
    print(token);
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
      user.name!,
      user.email!,
      // user.phone ?? "",
      // user.bio ?? "",
      // user.??"",
    ]);
    print("/////////////////////////////");
    print(user.name);
    print(user.id);
    print(user.email);
  }

  static void setRecentSearche(User user, String searchJop) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(user.id);
    List? temp = pref.getStringList("SearchJop ${user.id}");
    Set<String> search = {searchJop};
    print("Search Before get from LocalDB : $search");

    if (temp != null) {
      search.addAll(pref.getStringList("SearchJop ${user.id}")!);
    }
    print("Search After get from LocalDB : $search");

    // print(search);

    pref.setStringList("SearchJop ${user.id}", search.toList());
  }

  static Future? getRecentSearche(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // await Future.delayed(const Duration(seconds: 1));

    print("the id : ${user.id}");

    List? temp = pref.getStringList("SearchJop ${user.id}");

    print("The All Searched Jop is : $temp");
    return temp;
  }

  static void deleteRecentSearche(User user, String searchJop) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? search = pref.getStringList("SearchJop ${user.id}");
    if (search != null) {
      search.removeWhere((element) => element == searchJop);
      pref.setStringList("SearchJop ${user.id}", search);
    }
  }

  static Future getuser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 1));

    List<String>? us = pref.getStringList("user");
    User? user;

    if (us?[0] != null) {
      print("The Is is not Empty ");
      user = User(
        id: int.parse(us![0]),
        name: us[1],
        email: us[2],
        // phone: us[3],
        // bio: us[4],
      );
    }
    print("The Is is  Empty ");

    return user;
  }
  //   static void setSaveJops(int jopsID) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //  pref.setStringList(key, value)
  // }
}
