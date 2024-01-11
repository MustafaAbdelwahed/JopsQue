import 'package:flutter/material.dart';
import 'package:graduated_project/database/local_database.dart';
import 'package:graduated_project/login/login_screen.dart';

import '../widgets/custom_elvated_button.dart';
import '../widgets/logo.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                pageNumber = value;
              });
            },
            controller: _pageController,
            children: const [
              OnboardingPage(
                image: 'assets/image/onboarding/Background 1.png',
                text: Text.rich(
                  TextSpan(
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(text: "Find a job, and"),
                        TextSpan(
                            text: " start building ",
                            style: TextStyle(color: Color(0xff3366FF))),
                        TextSpan(text: "your career from now on"),
                      ]),
                ),
                description:
                    'Explore over 25,924 available job roles and upgrade your operator now.',
              ),
              OnboardingPage(
                image: 'assets/image/onboarding/Background 2.png',
                text: Text.rich(
                  TextSpan(
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text: "Hundreds of jobs are waiting for you to"),
                        TextSpan(
                            text: " join together",
                            style: TextStyle(color: Color(0xff3366FF))),
                      ]),
                ),
                description:
                    'Immediately join us and start applying for the job you are interested in.',
              ),
              OnboardingPage(
                image: 'assets/image/onboarding/Background 3.png',
                text: Text.rich(
                  TextSpan(
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(text: "Get the best"),
                        TextSpan(
                            text: " choice for the job ",
                            style: TextStyle(color: Color(0xff3366FF))),
                        TextSpan(text: "you've always dreamed of"),
                      ]),
                ),
                description:
                    'The better the skills you have, the greater the good job opportunities for you.',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Logo(
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        LocalDataBase.setFirstTime();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false);
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                dotIndicator(),
                const SizedBox(
                  height: 16,
                ),
                CustomElvatedButton(
                  text: Text(
                    pageNumber == 2 ? "Get Started" : "Next",
                    style: const TextStyle(color: Colors.white),
                  ),
                  color: const Color(0xff3366FF),
                  onpress: () {
                    LocalDataBase.setFirstTime();
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.linear);
                    if (pageNumber == 2) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false);
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dotIndicator() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 3; i++)
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                    color: i == pageNumber
                        ? const Color(0xff3366FF)
                        : const Color(0xffADC8FF),
                    borderRadius: BorderRadius.circular(50)))
        ],
      );
    });
  }
}
