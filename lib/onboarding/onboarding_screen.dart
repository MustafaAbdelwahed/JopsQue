import 'package:flutter/material.dart';
import 'package:graduated_project/database/local_database.dart';

import '../home/home_screen.dart';
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
                image: 'assets/image/Background 1.png',
                title: 'Find a job, and start building your career from now on',
                description:
                    'Explore over 25,924 available job roles and upgrade your operator now.',
              ),
              OnboardingPage(
                image: 'assets/image/Background 2.png',
                title: 'Hundreds of jobs are waiting for you to join together',
                description:
                    'Immediately join us and start applying for the job you are interested in.',
              ),
              OnboardingPage(
                image: 'assets/image/Background 3.png',
                title:
                    'Get the best choice for the job you\'ve always dreamed of',
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
                              builder: (context) => const HomeScreen(),
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
                            builder: (context) => const HomeScreen(),
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
