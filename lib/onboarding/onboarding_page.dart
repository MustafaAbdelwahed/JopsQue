import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final Widget title;
  final String description;

  const OnboardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            width: 390,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
              // cacheHeight: 600,
            ),
          ),
          const SizedBox(height: 16.0),
          title,
          const SizedBox(height: 13.0),
          Text(description,
              style: const TextStyle(
                fontSize: 15.0,
              )),
        ],
      ),
    );
  }
}
