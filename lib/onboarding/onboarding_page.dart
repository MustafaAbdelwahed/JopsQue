import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
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
          Text(title,
              style:
                  const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          Text(description,
              style: const TextStyle(
                fontSize: 16.0,
              )),
        ],
      ),
    );
  }
}
