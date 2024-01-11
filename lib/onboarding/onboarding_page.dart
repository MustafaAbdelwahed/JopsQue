import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final Text text;
  final String description;

  const OnboardingPage(
      {super.key,
      required this.image,
      required this.text,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: text,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(description,
                style:
                    const TextStyle(fontSize: 16.0, color: Color(0xff6B7280))),
          ),
        ],
      ),
    );
  }
}
