import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/apply_jop/apply_jop_screen.dart';
import 'package:graduated_project/applyid_jop/applyid_jop_screen.dart';
import 'package:graduated_project/database/local_database.dart';
import 'package:graduated_project/home/bottom_navigation_bar_item.dart';
import 'package:graduated_project/home/screen/home_screen.dart';
import 'package:graduated_project/login/login_screen.dart';
import 'package:graduated_project/message/screen/home_messsage.dart';
import 'package:graduated_project/notification/notification_screen.dart';
import 'package:graduated_project/onboarding/onboarding_screen.dart';
import 'package:graduated_project/profile/screen/privacy_policy.dart';
import 'package:graduated_project/profile/screen/Login&secuirty/email_adress_screen.dart';
import 'package:graduated_project/profile/screen/Login&secuirty/phone_number_screen.dart';
import 'package:graduated_project/profile/screen/Login&secuirty/two_step_verification/first_screen.dart';
import 'package:graduated_project/profile/screen/Login&secuirty/two_step_verification/secound_screen.dart';
import 'package:graduated_project/profile/screen/Login&secuirty/two_step_verification/thired_screen.dart';

import 'package:graduated_project/profile/screen/edit_profile_screen.dart';
import 'package:graduated_project/profile/screen/help_center.dart';
import 'package:graduated_project/profile/screen/language_screen.dart';
import 'package:graduated_project/profile/screen/login_and_security_screen.dart';
import 'package:graduated_project/profile/screen/notification_screen.dart';
import 'package:graduated_project/profile/screen/portfolio_screen.dart';
import 'package:graduated_project/profile/screen/profile_screen.dart';
import 'package:graduated_project/profile/screen/terms_and_conditions.dart';
import 'package:graduated_project/saved_jops/saved_screen.dart';
import 'package:graduated_project/test1/test1.dart';
import 'package:graduated_project/widgets/custom_search.dart';

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
      home: LoginScreen(),
    );
  }
}
