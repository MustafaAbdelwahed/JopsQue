// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/create_accoun/screen/create_accoun_screen.dart';
import 'package:graduated_project/database/local_database.dart';
import 'package:graduated_project/forgot_password/forgot_password_screen.dart';
import 'package:graduated_project/home/bottom_navigation_bar_item.dart';
import 'package:graduated_project/home/screen/home_screen.dart';
import 'package:graduated_project/model/user.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';
import 'package:graduated_project/widgets/logo_app.dart';
import 'package:graduated_project/widgets/logos.dart';
import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRmember = false;
  bool isvisible = true;
  AppBar appBar = AppBar(
    actions: const [
      Logo(
        height: 19,
        width: 81,
      ),
      SizedBox(
        width: 20,
      )
    ],
  );

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size.height;
    var notifySize = MediaQuery.of(context).padding.top;
    var appBarSize = appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 30),
          // padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          height: pageSize - (appBarSize + notifySize),
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
                // suffixIcons: Icons.abc_rounded,
              ),
              const SizedBox(height: 16),

              CustomeTextField(
                  controller: _passwordController,
                  prefixIcons: const Icon(Icons.lock_outline_rounded),
                  suffixIcons: GestureDetector(
                      onTap: () {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },
                      child: Icon(
                          isvisible ? Icons.visibility_off : Icons.visibility)),
                  hintext: "Password",
                  isPass: isvisible),
              const SizedBox(height: 20),
              Visibility(
                visible: true,
                child: Row(
                  children: [
                    Checkbox(
                      side: const BorderSide(color: Color(0xff9CA3AF)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      value: isRmember,
                      onChanged: (value) {
                        setState(() {
                          isRmember = value!;
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
              const Expanded(
                child: SizedBox(
                    // height: 173,
                    ),
              ),

              // const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Dont’t have an account?",
                    style: TextStyle(color: Color(0xff9CA3AF)),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreateAccounScreen(),
                    )),
                    child: const Text("Register",
                        style: TextStyle(
                          color: Color(0XFF3366FF),
                          fontWeight: FontWeight.w500,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Consumer(builder: (context, ref, _) {
                return CustomElvatedButton(
                  text: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: const Color(0xff3366FF),
                  onpress: () async {
                    bool isLogin = await ref.watch(providerr).login(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                        isRmember);
                    if (!isLogin) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("the email or password is not correct")));
                    } else {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => BootomNavigator(
                                  // user: user,
                                  )),
                          (route) => false);
                    }

                    // login(ref, isRmember);
                  },
                );
              }),
              const SizedBox(height: 20),
              const SizedBox(
                height: 20,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 2),
                    ),
                    SizedBox(width: 25),
                    Text(
                      "Or Login With Account",
                      style: TextStyle(color: Color(0xff6B7280)),
                    ),
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
              ),
              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> login(WidgetRef ref, bool isRmember) async {
  //   String email = _emailController.text.trim();
  //   String password = _passwordController.text.trim();
  //   Dio dio = Dio();

  //   final response = await dio.post(
  //     "https://project2.amit-learning.com/api/auth/login",
  //     data: {
  //       'email': email,
  //       'password': password,
  //     },
  //     options: Options(headers: {
  //       "Accept": "application/json",
  //     }, validateStatus: (_) => true),
  //   );
  //   if (!response.data['status']) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text("the email or password is not correct")));
  //   } else {
  //     print(response);
  //     final user = User.fromJson(response.data['user']);
  //     user.token = response.data['token'];

  //     if (isRmember) {
  //       LocalDataBase.setUser(user);
  //       LocalDataBase.setToken(user.token!);
  //     }

  //     ref.watch(providerr).user = user;
  //     ref.watch(providerr).getJops();
  //     // ref.read(providerr).getDataFromAPI();
  //   }
  // }
}
