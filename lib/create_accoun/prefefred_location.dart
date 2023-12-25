import 'package:flutter/material.dart';
import 'package:graduated_project/test1/test1.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';

import '../widgets/logo.dart';
import 'work_interested_irem.dart';

class PrefefredLocation extends StatelessWidget {
  const PrefefredLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 39, right: 15, left: 15, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "What type of work are you interested in?",
                // textAlign: TextAlign.end,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                  "Tell us what you’re interested in so we can customise the app for your needs.",
                  style: TextStyle(
                      color: Color(0xff6B7280),
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 30),
              const SizedBox(
                height: 60,
              ),
              CustomElvatedButton(
                text: const Text("Next"),
                onpress: () {},
                color: const Color(0xff3366FF),
              )
            ],
          ),
        ),
      ),
    );
  }
}
