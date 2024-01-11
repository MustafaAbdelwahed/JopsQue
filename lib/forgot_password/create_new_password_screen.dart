import 'package:flutter/material.dart';
import 'package:graduated_project/forgot_password/password_changed_succesfully.dart';
import 'package:graduated_project/widgets/logo.dart';

import '../widgets/custom_elvated_button.dart';
import '../widgets/text_field/custom_textfield_pass.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController _verfiyPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            const EdgeInsets.only(top: 39, right: 20, left: 20, bottom: 20),
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Create new password",
                    // textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                      "Set your new password so you can login and acces Jobsque",
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(height: 30),

                  CustomeTextFieldPAss(
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
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeTextFieldPAss(
                    errorText: "Both password must match",
                    validator: (value) {
                      if (value == null ||
                          value.length <= 8 &&
                              _passwordController.text ==
                                  _verfiyPasswordController.text) {
                        return "Both password must match";
                      }
                      return null;
                    },
                    textInputType: TextInputType.visiblePassword,
                    controller: _verfiyPasswordController,
                    prefixIcons: Icons.lock_outline_rounded,
                    suffixIcons: Icons.visibility_off,
                    hintext: "Password",
                  ),
                  const SizedBox(height: 20),

                  const SizedBox(
                    height: 270,
                  ),

                  // const Spacer(),

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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const PasswordChangedSuccesfully(),
                      ));
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
