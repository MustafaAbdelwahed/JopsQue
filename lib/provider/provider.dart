import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/local_database.dart';
import '../model/jops.dart';
import '../widgets/custom_container.dart';

final providerr = ChangeNotifierProvider<JopProvider>((ref) => JopProvider());

class JopProvider extends ChangeNotifier {
  JopProvider() {
    getDataFromAPI();
  }
  List<CustomContainer> allJops = [];
  List<CustomContainer> filterJops = [];
  int? whichTypeOfWork;
  PlatformFile? pdfData;
  // Future<void> getUser() async {}

  Future<void> getDataFromAPI() async {
    Dio dio = Dio();
    String token = await LocalDataBase.getToken();
    final response = await dio.get(
      "https://project2.amit-learning.com/api/jobs",
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
        allJops.add(CustomContainer(
          jops: Jops.fromJson(element),
        ));
      }
    }
    notifyListeners();
  }

  Future<void> getSearchedJobs(
    String? name,
  ) async {
    // List<CustomContainer> temp = [];

    filterJops.clear();
    Dio dio = Dio();
    String token = await LocalDataBase.getToken();
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
        filterJops.add(CustomContainer(
          jops: Jops.fromJson(element),
        ));
      }
    }
    notifyListeners();
  }

  Future<void> getFilterdJobs(
      {String? name, String? location, String? salary}) async {
    // List<CustomContainer> temp = [];
    //TODO add Filter Jops

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
        filterJops.add(CustomContainer(
          jops: Jops.fromJson(element),
        ));
      }
    }
    notifyListeners();
  }

  void setCVFile() async {
    var filePath = await FilePicker.platform
        .pickFiles()
        .then((result) => result?.files.single);
    pdfData = filePath;
    notifyListeners();
  }

  void removeCVData() async {
    pdfData = null;
    notifyListeners();
  }

  // void setApplyJop() async {
  //   final cvData = pdfData;

  //   Dio dio = Dio();
  //   final response = dio.post(
  //     "https://project2.amit-learning.com/api/apply",
  //     data: {
  //       "cv_file": pdfData!.path,
  //       "name":
  //     },
  //   );
  // }
}
