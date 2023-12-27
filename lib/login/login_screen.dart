import 'package:flutter/material.dart';
import 'package:graduated_project/create_accoun/create_accoun_screen.dart';
import 'package:graduated_project/forgot_password/forgot_password_screen.dart';
import 'package:graduated_project/widgets/logo.dart';

import '../widgets/custom_elvated_button.dart';
import '../widgets/logos.dart';
import '../widgets/text_field/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool remember = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
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
      body: Padding(
        padding:
            const EdgeInsets.only(top: 39, right: 15, left: 15, bottom: 20),
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Login",
                    // textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const Text("Please login to find your dream job",
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(height: 30),

                  CustomeTextField(
                    textInputType: TextInputType.name,
                    controller: _usernameController,
                    prefixIcons: Icons.person_outline,
                    hintext: "Username",
                    suffixIcons: Icons.abc_rounded,
                  ),
                  const SizedBox(height: 16),

                  CustomeTextField(
                      textInputType: TextInputType.number,
                      controller: _passwordController,
                      prefixIcons: Icons.lock_outline_rounded,
                      suffixIcons: Icons.visibility_off,
                      hintext: "Password",
                      isPass: true),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: true,
                    child: Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          value: remember,
                          onChanged: (value) {
                            setState(() {
                              remember = value!;
                            });
                          },
                        ),
                        const Text("Remember me"),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen(),
                            ));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Color(0XFF3366FF)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 173,
                  ),

                  // const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Dont’t have an account?"),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CreateAccounScreen(),
                        )),
                        child: const Text("Register",
                            style: TextStyle(color: Color(0XFF3366FF))),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomElvatedButton(
                    text: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: const Color(0xff3366FF),
                    onpress: () {},
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 2),
                        ),
                        SizedBox(width: 25),
                        Text("Or Login With Account"),
                        SizedBox(width: 25),
                        Expanded(
                          child: Divider(thickness: 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Logos(
                          image: AssetImage("assets/image/logo/google.png"),
                          text: Text("Google")),
                      // Spacer(),
                      Logos(
                          image: AssetImage("assets/image/logo/Facebook.png"),
                          text: Text("Facebook")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
