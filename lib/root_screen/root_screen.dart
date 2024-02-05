import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/home/bottom_navigation_bar_item.dart';
import 'package:graduated_project/login/login_screen.dart';
import 'package:graduated_project/onboarding/onboarding_screen.dart';

import '../splach_screen/splach_screen.dart';
import 'root_provider.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(rootProvider).when(
        data: (data) {
          switch (data) {
            case "first-time":
              return const OnboardingScreen();
            case "login-screen":
              return const LoginScreen();
            case "home-screen":
              return BootomNavigator();

            default:
              return const LoginScreen();
          }

          // if (data == "first-time") {
          //   return const OnboardingScreen();
          // } else {
          //
          // }
        },
        error: (e, s) => const Scaffold(
                body: Center(
              child: Text("you have error "),
            )),
        loading: () => const SplashScreen());
  }
}
