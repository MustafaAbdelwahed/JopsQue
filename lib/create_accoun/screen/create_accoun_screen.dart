// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduated_project/create_accoun/screen/work_interested_screen.dart';
import 'package:graduated_project/widgets/logo_app.dart';

import '../../widgets/logos.dart';
import '../../widgets/custom_elvated_button.dart';
import '../../widgets/text_field/custom_textfield.dart';
import '../../widgets/text_field/custom_textfield_pass.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size.height;
    var notifySize = MediaQuery.of(context).padding.top;
    var appBarSize = appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: pageSize - (appBarSize + notifySize),
          padding:
              const EdgeInsets.only(top: 39, right: 15, left: 15, bottom: 20),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Create Account",
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

              CustomeTextField(
                controller: _usernameController,
                prefixImage: Image.asset(
                  "assets/image/icons/profile.png",
                  scale: 2.5,
                ),
                // prefixIcons: const Icon(Icons.person_outline),
                hintext: "Username",
              ),
              const SizedBox(height: 16),
              CustomeTextField(
                controller: _emailController,
                prefixImage: Image.asset(
                  "assets/image/icons/sms.png",
                  scale: 2.5,
                ),
                // prefixIcons: const Icon(Icons.email_outlined),
                hintext: "Email",
              ),
              const SizedBox(height: 16),

              Form(
                key: _formKey,
                child: CustomeTextFieldPAss(
                  errorText: "Password must be at least 8 characters",
                  validator: (value) {
                    if (value == null || value.length <= 8) {
                      return 'Password must be at least 8 characters ';
                    }
                    return null;
                  },
                  textInputType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  prefixImage: Image.asset(
                    "assets/image/icons/lock.png",
                    color: const Color(0xff9CA3AF),
                    scale: 2.5,
                  ),
                  // prefixIcons: Icons.lock_outline_rounded,
                  suffixIcons: Icons.visibility_off,
                  hintext: "Password",
                ),
              ),
              const SizedBox(height: 20),

              const Expanded(
                child: SizedBox(
                    // height: 105,
                    ),
              ),

              // const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Color(0xff9CA3AF)),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF3366FF))))
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
                onpress: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  signUp(context);
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
    );
  }

  Future signUp(BuildContext context) async {
    String name = _usernameController.text;
    String password = _passwordController.text;
    String email = _emailController.text;
    Dio dio = Dio();

    final response =
        await dio.post("https://project2.amit-learning.com/api/auth/register",
            data: {
              "name": name,
              'email': email,
              'password': password,
            },
            options: Options(validateStatus: (_) => true)
            // options: Options(headers: {
            //   "Accept": "application/json",
            // }, validateStatus: (_) => true),
            );
    if (!response.data['status']) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("the username, email or password is not correct")));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const WorkInterestedScreen(),
      ));
    }
  }
}
