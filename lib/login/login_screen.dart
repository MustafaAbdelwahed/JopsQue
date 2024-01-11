// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduated_project/create_accoun/create_accoun_screen.dart';
import 'package:graduated_project/database/local_database.dart';
import 'package:graduated_project/forgot_password/forgot_password_screen.dart';
import 'package:graduated_project/home/screen/home_screen.dart';
import 'package:graduated_project/model/user.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
      body: Padding(
        padding:
            const EdgeInsets.only(top: 39, right: 15, left: 15, bottom: 20),
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: SingleChildScrollView(
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
                  controller: _emailController,
                  prefixIcons: const Icon(Icons.person_outline),
                  hintext: "Username",
                  suffixIcons: Icons.abc_rounded,
                ),
                const SizedBox(height: 16),

                CustomeTextField(
                    controller: _passwordController,
                    prefixIcons: const Icon(Icons.lock_outline_rounded),
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
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
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
                  onpress: () {
                    login();
                  },
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
    );
  }

  Future<void> login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    Dio dio = Dio();

    final response = await dio.post(
      "https://project2.amit-learning.com/api/auth/login",
      data: {
        'email': email,
        'password': password,
      },
      options: Options(headers: {
        "Accept": "application/json",
      }, validateStatus: (_) => true),
    );

    if (!response.data['status']) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("the email or password is not correct")));
    } else {
      print(response.data);
      final user = User.fromJson(response.data['user']);
      user.token = response.data['token'];
      print(user.token);

      LocalDataBase.setUser(user);
      LocalDataBase.setToken(user.token!);
      // await Future.delayed(Duration(seconds: 2));

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    user: user,
                  )),
          (route) => false);
    }
  }
}
