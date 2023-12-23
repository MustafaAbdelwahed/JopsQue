// ignore_for_file: prefer_const_declarations

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/database/local_database.dart';

final rootProvider = FutureProvider((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  final bool isFirstTime = await LocalDataBase.getFirstTime();
  if (isFirstTime == true) {
    return "first-time";
  } else {
    return "not-first_time";
  }
});
