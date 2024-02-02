import 'package:flutter/material.dart';

// import '../onboarding/onboarding_screen.dart';
import '../widgets/logo_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: const Color(0xffe8f0ff).withOpacity(0.7)),
          height: 189,
          width: 190,
          child: const Logo(
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }
}
