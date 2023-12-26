import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/create_accoun/prefefred_location.dart';
import 'package:graduated_project/create_accoun/create_accoun_screen.dart';
import 'package:graduated_project/create_accoun/work_interested_screen.dart';
import 'package:graduated_project/onboarding/onboarding_screen.dart';
import 'package:graduated_project/root_screen/root_screen.dart';
import 'package:graduated_project/test1/test2.dart';

import 'login/login_screen.dart';
import 'test1/test1.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'graduted project',
      home: PrefefredLocationScreeen(),
    );
  }
}
