import 'package:flutter/material.dart';
import 'package:graduated_project/widgets/logo.dart';

import '../widgets/logos.dart';
import '../widgets/custom_elvated_button.dart';
import '../widgets/custom_textfield.dart';

class CreateAccounScreen extends StatefulWidget {
  const CreateAccounScreen({super.key});

  @override
  State<CreateAccounScreen> createState() => _CreateAccounScreenState();
}

class _CreateAccounScreenState extends State<CreateAccounScreen> {
  bool remember = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
                    "Cereate Account",
                    // textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const Text("Please create an account to find your dream job",
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(height: 30),

                  TextFieldCustome(
                    textInputType: TextInputType.name,
                    controller: _usernameController,
                    prefixIcons: Icons.person_outline,
                    hintext: "Username",
                    suffixIcons: Icons.abc_rounded,
                  ),
                  const SizedBox(height: 16),
                  TextFieldCustome(
                    textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                    prefixIcons: Icons.email_outlined,
                    hintext: "Email",
                    suffixIcons: Icons.abc_rounded,
                  ),
                  const SizedBox(height: 16),

                  TextFieldCustome(
                      textInputType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      prefixIcons: Icons.lock_outline_rounded,
                      suffixIcons: Icons.visibility_off,
                      hintext: "Password",
                      isPass: true),
                  const SizedBox(height: 20),

                  const SizedBox(
                    height: 138,
                  ),

                  // const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      const SizedBox(width: 6),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Login",
                              style: TextStyle(color: Color(0XFF3366FF))))
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomElvatedButton(
                    text: const Text(
                      "Create account",
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
                          image: AssetImage("assets/logo/google.png"),
                          text: Text("Google")),
                      // Spacer(),
                      Logos(
                          image: AssetImage("assets/logo/Facebook.png"),
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
