import 'package:flutter/material.dart';
import 'package:graduated_project/login/login_screen.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';

class PasswordChangedSuccesfully extends StatelessWidget {
  PasswordChangedSuccesfully({super.key});
  AppBar appbar = AppBar(
    actions: const [
      SizedBox(
        width: 20,
      )
    ],
  );
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Spacer(),
            Image.asset("assets/image/Ilustration/Email Ilustration.png"),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Password changed succesfully!", textAlign: TextAlign.center,
              // textAlign: TextAlign.end,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
                "Your password has been changed successfully, we will let you know if there are more problems with your account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            const Spacer(
              flex: 3,
            ),
            CustomElvatedButton(
                text: const Text("Open email app"),
                onpress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                },
                color: const Color(0xff3366FF)),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(right: 15, left: 15, bottom: 30),
      //   child: SingleChildScrollView(
      //     child: Container(
      //       height: pageSize - (appBarSize + notifySize),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.stretch,
      //         children: [
      //           const Spacer(),
      //           Image.asset(
      //               "assets/image/Ilustration/Password Succesfully Ilustration.png"),
      //           const SizedBox(
      //             height: 24,
      //           ),
      //           const Text(
      //             "Password changed succesfully!",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      //           ),
      //           const SizedBox(
      //             height: 12,
      //           ),
      //           const Text(
      //               "Your password has been changed successfully, we will let you know if there are more problems with your account",
      //               textAlign: TextAlign.center,
      //               style: TextStyle(
      //                   color: Color(0xff6B7280),
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.w400)),
      //           const Spacer(
      //             flex: 3,
      //           ),
      //           CustomElvatedButton(
      //               text: const Text("Open email app"),
      //               onpress: () {
      //                 Navigator.of(context).pushAndRemoveUntil(
      //                     MaterialPageRoute(
      //                       builder: (context) => const LoginScreen(),
      //                     ),
      //                     (route) => false);
      //               },
      //               color: const Color(0xff3366FF)),
      //           // const SizedBox(
      //           //   height: 20,
      //           // )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
