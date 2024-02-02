import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/applyid_jop/applyid_jop_screen.dart';
import 'package:graduated_project/home/screen/search_screen.dart';
import 'package:graduated_project/message/widget/message_items.dart';
import 'package:graduated_project/model/company.dart';
import 'package:graduated_project/model/user.dart';
import 'package:graduated_project/profile/screen/portfolio_screen.dart';
import 'package:graduated_project/saved_jops/widget/saved_jops_tem.dart';
import 'package:graduated_project/widgets/custom_search.dart';
// import 'package:graduated_project/saved_jops/widget/saved_jops_item.dart';

import '../database/local_database.dart';
import '../model/jops.dart';
import '../widgets/jops_item.dart';

final providerr = ChangeNotifierProvider<JopProvider>((ref) => JopProvider());

class JopProvider extends ChangeNotifier {
  JopProvider() {
    // getUser();
  }
  List<JopsItem> allJops = [];
  List<RecentSearches> recentSearches = [];
  Set<PortfolioItem> portfolioList = {};
  List<SavedJopsItem> savedJops = [];
  List<AppliedJopItem> activeJop = [];
  List<JopsItem> filterJops = [];
  List<MessageItems> messageList = [];
  List<CustomSearch> messagesItem = [];
  String? typeOfWork;
  PlatformFile? pdfData;
  User? user;
  bool isSwitchingVerify = false;
  bool isTsvVerify = false;
/////////////////////////////////////////////getJops

  Future<void> getJops() async {
    Dio dio = Dio();
    String token = await LocalDataBase.getToken() ?? user!.token;
    final response = await dio.get(
      "https://project2.amit-learning.com/api/jobs",
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    List listOfJops = response.data['data'];
    allJops.clear();
    activeJop.clear();

    if (listOfJops.isEmpty) {
    } else {
      for (var element in response.data['data']) {
        allJops.add(JopsItem(
          jop: Jops.fromJson(element),
        ));
        activeJop.add(AppliedJopItem(
          jop: Jops.fromJson(element),
        ));
      }
    }
    notifyListeners();
  }

/////////////////////////////////////////////about user
  ///
  Future login(
    String email,
    String password,
    bool isRmember,
  ) async {
    Dio dio = Dio();
    final response = await dio.post(
      "https://project2.amit-learning.com/api/auth/login",
      data: {
        'email': email,
        'password': password,
      },
      options: Options(headers: {
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );
    print(response);
    if (!response.data['status']) {
      return false;
    } else {
      user = User.fromJson(response.data['user']);
      user!.token = response.data['token'];

      print(user!.token);

      if (isRmember) {
        LocalDataBase.setUser(user!);
        LocalDataBase.setToken(user!.token!);
      }

      // user = datauser;
      notifyListeners();
    }
    getJops();
    return true;
  }

  Future<void> getUser() async {
    // await LocalDataBase.getToken();
    if (user != null) {
      return;
    }

    Dio dio = Dio();
    String token = user!.token ?? await LocalDataBase.getToken();
    final response = await dio.get(
      "https://project2.amit-learning.com/api/auth/profile",
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    user = User.fromJson(response.data['data']);

    // getMessage();
    getJops();
    getSearch();
    notifyListeners();
  }

  Future<void> editUser() async {
    Dio dio = Dio();
    String token = user?.token ?? await LocalDataBase.getToken();
    final response = await dio.put(
      "https://project2.amit-learning.com/api/user/profile/portofolios",
      data: {
        "bio": user?.bio,
        "address": user?.address,
        "mobile": user?.phone,
        "language": user?.language,
        "interested_work": user?.interestedWork,
        "offline_place": user?.offlinePlace,
        "remote_place": user?.remotePlace,
        "experience": user?.experience,
        "personal_detailed": user?.personalDetailed,
        "education": user?.education,
      },
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    notifyListeners();
  }

//TODO  changePassword
  Future<void> changePassword() async {
    Dio dio = Dio();
    String token = user!.token ?? await LocalDataBase.getToken();
    final response = await dio.post(
      "https://project2.amit-learning.com/api/auth/user/update",
      data: {"password": user?.password},
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    notifyListeners();
  }

  void logOut() {
    user = null;
    LocalDataBase.clearAll();
    notifyListeners();
  }

/////////////////////////////////////////////message
  Future<void> getMessage() async {
    Dio dio = Dio();
    // String token = await LocalDataBase.getToken() ?? user!.token;
    String token = user!.token ?? await LocalDataBase.getToken();
    int id = user!.id ?? await LocalDataBase.getID();
    final companyResponse = await dio.get(
      "https://project2.amit-learning.com/api/showCompany",
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    // final messsageResponse = await dio.get(
    //   "https://project2.amit-learning.com/api/chat",
    //   queryParameters: {
    //     "user_id": 736,
    //     "comp_id": 1,
    //   },
    //   options: Options(headers: {
    //     'Authorization': 'Bearer $token',
    //     'Content-Type': 'application/json',
    //     "Accept": "application/json",
    //   }, validateStatus: (_) => true),
    // );

    // print(companyResponse.statusCode);
    List company = companyResponse.data["data"];
    for (var element in company) {
      messageList.add(MessageItems(
        company: Company.fromJson(element),
      ));
    }
    // print(company);

    // print(messsageResponse.statusCode);
    // print(messsageResponse);
    // user = User.fromJson(response.data['data']['profile']);
    // print("/////////////////////////////////");
    // print("the ID: ${user?.bio == null}");
    // notifyListeners();
  }

/////////////////////////////////////////////searchJops
  Future<void> getSearchedJobs(
    String? name,
  ) async {
    filterJops.clear();

    Dio dio = Dio();
    // String token =  await LocalDataBase.getToken();
    String token = user!.token ?? await LocalDataBase.getToken();
    final response = await dio.post(
      "https://project2.amit-learning.com/api/jobs/filter",
      data: {
        'name': name,
      },
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );
    List listOfJops = response.data['data'];
    if (listOfJops.isEmpty) {
    } else {
      for (var element in response.data['data']) {
        filterJops.add(JopsItem(
          jop: Jops.fromJson(element),
        ));
      }
    }
    notifyListeners();
  }

/////////////////////////////////////////////filterJop
  Future<void> getFilterdJobs(
      {String? name, String? location, String? salary}) async {
    //TODO add filter Jops

    filterJops.clear();
    Dio dio = Dio();
    String token = await LocalDataBase.getToken();
    final response = await dio.post(
      "https://project2.amit-learning.com/api/jobs/filter",
      data: {
        'name': name,
        'location': location,
        'salary': salary,
      },
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );
    List listOfJops = response.data['data'];
    if (listOfJops.isEmpty) {
    } else {
      for (var element in response.data['data']) {
        filterJops.add(JopsItem(
          jop: Jops.fromJson(element),
        ));
      }
    }
    notifyListeners();
  }

/////////////////////////////////////////////about CV
  void setCVFile() async {
    var filePath = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    ).then((result) => result?.files.single);
    pdfData = filePath;
    notifyListeners();
  }

  void removeCVData() async {
    pdfData = null;
    notifyListeners();
  }
/////////////////////////////////////////////about Jops

  void savedJop(Jops jops) async {
    savedJops.add(SavedJopsItem(
      // key: ValueKey(jops.id),
      jop: jops,
    ));
    jops.isSaved = true;

    // int insexAllJop = allJops.indexWhere((element) => element.jop.id == jops.id);
    allJops[allJops.indexWhere((element) => element.jop.id == jops.id)] =
        JopsItem(jop: jops);
    activeJop[activeJop.indexWhere((element) => element.jop.id == jops.id)] =
        AppliedJopItem(jop: jops);
    // int index = allJops.indexWhere((element) => element.jop.id == jops.id);
    notifyListeners();
  }

  void unsaveJop(Jops jops) async {
    jops.isSaved = false;
    savedJops.removeWhere((element) => element.jop.id == jops.id);

    // int index = allJops.indexWhere((element) => element.jop.id == jops.id);
    allJops[allJops.indexWhere((element) => element.jop.id == jops.id)] =
        JopsItem(jop: jops);

    activeJop[activeJop.indexWhere((element) => element.jop.id == jops.id)] =
        AppliedJopItem(jop: jops);

    notifyListeners();
  }
/////////////////////////////////////////////about Portfolio

  void setPortfolio() async {
    var filePath = await FilePicker.platform
        .pickFiles(
            // type: FileType.custom,
            // allowedExtensions: ['pdf', 'doc'],
            )
        .then((result) => result?.files.single);
    if (filePath == null) {
      // print(portfolioList.length);
    } else {
      if (portfolioList
          .where((element) => element.dataOfPdf!.name == filePath.name)
          .isNotEmpty) {
      } else {
        portfolioList.add(
          PortfolioItem(
            dataOfPdf: filePath,
          ),
        );
      }
    }

    notifyListeners();
  }

  void removePortfolio(String name) async {
    portfolioList.removeWhere((element) => element.dataOfPdf?.name == name);

    notifyListeners();
  }

//////////////////////////////actev TWo Step verify
  void verifyde() async {
    isTsvVerify = !isTsvVerify;
    notifyListeners();
  }

  void switchVerify() async {
    isSwitchingVerify = !isSwitchingVerify;
    notifyListeners();
  }

  ////////////////////////////Search
  ///
  void getSearch() async {
    List? temp = await LocalDataBase.getRecentSearche(user!);

    if (temp == null || temp.isEmpty) {
      return;
    }
    for (var element in temp) {
      recentSearches.add(RecentSearches(searchName: element));
    }

    notifyListeners();
  }

  void setSearch(String searchName) async {
    LocalDataBase.setRecentSearche(user!, searchName);
    getSearchedJobs(searchName);
    print("////////////////////////////////////////////////////////");

    await Future.delayed(Duration(milliseconds: 1500));
    recentSearches.removeWhere((element) => element.searchName == searchName);
    recentSearches.insert(0, RecentSearches(searchName: searchName));

    print(searchName);

    notifyListeners();
  }

  void deleteSearch(String searchName) async {
    LocalDataBase.deleteRecentSearche(user!, searchName);

    print(searchName);

    recentSearches.removeWhere((element) => element.searchName == searchName);

    // recentSearches.add(RecentSearches(searchName: searchName));
    notifyListeners();
  }
}
