// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduated_project/create_accoun/work_interested_screen.dart';
import 'package:graduated_project/widgets/logo.dart';

import '../widgets/logos.dart';
import '../widgets/custom_elvated_button.dart';
import '../widgets/text_field/custom_textfield.dart';
import '../widgets/text_field/custom_textfield_pass.dart';

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

                CustomeTextField(
                  textInputType: TextInputType.name,
                  controller: _usernameController,
                  prefixIcons: Icons.person_outline,
                  hintext: "Username",
                  suffixIcons: Icons.abc_rounded,
                ),
                const SizedBox(height: 16),
                CustomeTextField(
                  textInputType: TextInputType.emailAddress,
                  controller: _emailController,
                  prefixIcons: Icons.email_outlined,
                  hintext: "Email",
                  suffixIcons: Icons.abc_rounded,
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
                    prefixIcons: Icons.lock_outline_rounded,
                    suffixIcons: Icons.visibility_off,
                    hintext: "Password",
                  ),
                ),
                const SizedBox(height: 20),

                const SizedBox(
                  height: 105,
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
                  onpress: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    // signUp();
                    print(signUp());
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

  // Future<void> signUp() async {
  //   String name = _usernameController.text;
  //   String password = _passwordController.text;
  //   String email = _emailController.text;

  //   Dio dio = Dio();
  //   final response = await dio.put(
  //     "https://project2.amit-learning.com/api/auth/register",
  //     data: {
  //       "name": name,
  //       "email": email,
  //       "password": password,
  //     },
  //     options: Options(headers: {
  //       "Accept": "application/json",
  //     }, validateStatus: (_) => true),
  //   );
  //   print(response);
  // }

  Future signUp() async {
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
    print(response.data);
    if (!response.data['status']) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("the username, email or password is not correct")));
    } else {
      final id = response.data['profile']['user_id'];
      final usrname = response.data['profile']['name'];
      final email = response.data['profile']['email'];
      final token = response.data['token'];
      print("naem $usrname  ,id  $id  ,   email $email & token  $token");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const WorkInterestedScreen(),
      ));
    }
  }
}
