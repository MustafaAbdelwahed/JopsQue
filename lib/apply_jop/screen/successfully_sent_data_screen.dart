import 'package:flutter/material.dart';
import 'package:graduated_project/home/bottom_navigation_bar_item.dart';

import 'package:graduated_project/widgets/custom_elvated_button.dart';

class SuccessfullySentDataScreen extends StatelessWidget {
  const SuccessfullySentDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              "assets/image/Ilustration/Data Ilustration.png",
              height: 142,
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Your data has been successfully sent",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
                "You will get a message from our team, about the announcement of employee acceptance",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            const Spacer(
              flex: 3,
            ),
            CustomElvatedButton(
                text: const Text("Back to home"),
                onpress: () async {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => BootomNavigator(),
                      ),
                      (route) => false);
                },
                color: const Color(0xff3366FF)),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
