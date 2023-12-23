import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/onboarding/onboarding_screen.dart';

import '../home/home_screen.dart';
import '../splach_screen/splach_screen.dart';
import 'root_provider.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(rootProvider).when(
        data: (data) {
          if (data == "first-time") {
            return const OnboardingScreen();
          } else {
            return const HomeScreen();
          }
        },
        error: (e, s) => const Scaffold(
                body: Center(
              child: Text("you have error "),
            )),
        loading: () => const SplashScreen());
  }
}
