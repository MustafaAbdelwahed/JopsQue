import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/applyid_jop/applyid_jop_screen.dart';
import 'package:graduated_project/message/widget/message_items.dart';
import 'package:graduated_project/model/company.dart';
import 'package:graduated_project/model/user.dart';
import 'package:graduated_project/profile/screen/portfolio_screen.dart';
import 'package:graduated_project/saved_jops/widget/saved_jops_tem.dart';
import 'package:graduated_project/widgets/custom_search.dart';

import '../database/local_database.dart';
import '../home/widget/recent_searches.dart';
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
  bool isTwoStepVerify = false;
/////////////////////////////////////////////jops

  Future<void> getJops() async {
    Dio dio = Dio();
    String token = user?.token ?? await LocalDataBase.getToken();
    int userID = user?.id ?? await LocalDataBase.getID();

    List? savedJopsId = await LocalDataBase.getSaveJops(userID);

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
        Jops jop = Jops.fromJson(element);

        if (savedJopsId != null && savedJopsId.isNotEmpty) {
          for (var savejop in savedJopsId) {
            if (savejop == jop.id.toString()) {
              savedJops.add(SavedJopsItem(jop: jop));

              jop.isSaved = true;
            }
          }
        }

        allJops.add(JopsItem(
          jop: jop,
        ));

        activeJop.add(AppliedJopItem(
          jop: jop,
        ));
      }
    }

    notifyListeners();
  }

  Future setSaveJops(int jopID) async {
    // await Future.delayed(const Duration(seconds: 1));
    int userID = user?.id ?? await LocalDataBase.getID();
    LocalDataBase.setSaveJops(userID.toString(), jopID.toString());
    // print("the id : ${userID}");
  }

/////////////////////////////////////////////about user

  // Future<void> selectImage() async {
  //   final pickedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);

  //   user!.image = pickedImage!.path;
  //   print("the image is ${user!.image}");
  //   notifyListeners();
  // }

  Future login(String email, String password, bool isRmember) async {
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
    if (response.statusCode != 200) {
      return false;
    } else {
      user = User.fromJson(response.data['user']);
      user!.token = response.data['token'];

      if (isRmember) {
        LocalDataBase.setUser(user!);
        LocalDataBase.setToken(user!.token!);
      }

      // user = datauser;
      notifyListeners();
    }
    getSearch();

    getJops();
    return true;
  }

  Future<void> getUser() async {
    // await LocalDataBase.getToken();
    if (user != null) {
      return;
    }

    Dio dio = Dio();
    String token = user?.token ?? await LocalDataBase.getToken();
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
    await dio.put(
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

  Future<void> changePassword() async {
    Dio dio = Dio();
    String token = user?.token ?? await LocalDataBase.getToken();
    await dio.post(
      "https://project2.amit-learning.com/api/auth/user/update",
      data: {"password": user?.password},
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    // notifyListeners();
  }

  void logOut() {
    user = null;
    allJops = [];
    recentSearches = [];
    portfolioList = {};
    savedJops = [];
    activeJop = [];
    filterJops = [];
    messageList = [];
    messagesItem = [];
    typeOfWork = null;
    pdfData = null;
    user = null;
    isSwitchingVerify = false;
    isTwoStepVerify = false;
    LocalDataBase.deleteUser();
    notifyListeners();
  }

/////////////////////////////////////////////message
  Future<void> getMessage() async {
    Dio dio = Dio();
    String token = user?.token ?? await LocalDataBase.getToken();
    final companyResponse = await dio.get(
      "https://project2.amit-learning.com/api/showCompany",
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    List company = companyResponse.data["data"];
    for (var element in company) {
      messageList.add(MessageItems(
        company: Company.fromJson(element),
      ));
    }
  }

/////////////////////////////////////////////searchJops
  Future<void> searchJobs(String? nameOfJop) async {
    filterJops.clear();
    Dio dio = Dio();
    String token = user?.token ?? await LocalDataBase.getToken();

    final response = await dio.post(
      "https://project2.amit-learning.com/api/jobs/filter",
      data: {
        'name': nameOfJop,
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
    savedJops.add(SavedJopsItem(jop: jops));

    int userID = user?.id ?? await LocalDataBase.getID();
    LocalDataBase.setSaveJops(userID.toString(), jops.id.toString());
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
    int userID = user?.id ?? await LocalDataBase.getID();

    LocalDataBase.deleteSaveJops(userID.toString(), jops.id.toString());

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
    isTwoStepVerify = !isTwoStepVerify;
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
    if (searchName.isNotEmpty) {
      LocalDataBase.setRecentSearche(user!, searchName);
      searchJobs(searchName);

      await Future.delayed(const Duration(milliseconds: 1500));
      recentSearches.removeWhere((element) => element.searchName == searchName);
      recentSearches.insert(0, RecentSearches(searchName: searchName));

      notifyListeners();
    }
  }

  void deleteSearch(String searchName) async {
    LocalDataBase.deleteRecentSearche(user!, searchName);

    recentSearches.removeWhere((element) => element.searchName == searchName);

    // recentSearches.add(RecentSearches(searchName: searchName));
    notifyListeners();
  }

  Future<Void?> sentDataToapplyJop(name, email, mobile, workType, jopId) async {
    Dio dio = Dio();
    // String token = await LocalDataBase.getToken();
    int id = user!.id ?? await LocalDataBase.getID();
    String token = user?.token ?? await LocalDataBase.getToken();
    final response = await dio.post(
      'https://project2.amit-learning.com/api/apply',
      data: {
        // 'cv_file': null,
        'name': name,
        'email': email,
        'mobile': mobile,
        'work_type': workType,
        // 'other_file': null,

        'jobs_id': jopId,
        'user_id': id
      },
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    return null;
  }
}
