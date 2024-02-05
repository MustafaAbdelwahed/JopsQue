// import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:graduated_project/forgot_password/check_email_screen.dart';
import 'package:graduated_project/login/login_screen.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';
import 'package:graduated_project/widgets/logo_app.dart';
import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController _emailControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Logo(
            height: 19,
            width: 81,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Reset Password",
              // textAlign: TextAlign.end,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
                "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
                style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: 30),
            CustomeTextField(
              prefixImage: Image.asset(
                "assets/image/icons/sms.png",
                scale: 2.2,
              ),
              // prefixIcons: Icon(Icons.email_outlined),
              hintext: "Enter your email....",
              controller: _emailControl,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "You remember your password",
                  style: TextStyle(color: Color(0XFF9CA3AF)),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Color(0XFF3366FF), fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElvatedButton(
              text: const Text("Request password reset"),
              onpress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CheckEmailScreen(),
                ));
              },
              color: const Color(0xff3366FF),
            ),
            // const SizedBox(
            //   height: 24,
            // )
          ],
        ),
      ),
    );
  }
}

int currentText = 0;
