import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/apply_jop/apply_jop_screen.dart';
import 'package:graduated_project/database/local_database.dart';
import 'package:graduated_project/home/screen/home_screen.dart';
import 'package:graduated_project/login/login_screen.dart';
import 'package:graduated_project/onboarding/onboarding_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              foregroundColor: Colors.black,
              elevation: 0,
              backgroundColor: Color(0xfffafafa))),
      debugShowCheckedModeBanner: false,
      title: 'graduted project',
      home: const LoginScreen(),
    );
  }
}
