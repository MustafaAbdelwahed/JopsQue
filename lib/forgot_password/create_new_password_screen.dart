import 'package:flutter/material.dart';
import 'package:graduated_project/forgot_password/password_changed_succesfully.dart';
import 'package:graduated_project/widgets/logo_app.dart';

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
      body: Container(
        padding:
            const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 30),
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
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
                  if (value == null || value.length < 8) {
                    return 'Password must be at least 8 characters ';
                  }
                  return null;
                },
                textInputType: TextInputType.visiblePassword,
                controller: _passwordController,
                prefixImage: Image.asset(
                  "assets/image/icons/lock.png",
                  color: const Color(0xff9CA3AF),
                  scale: 2.2,
                ),
                // prefixIcons: Icons.lock_outline_rounded,
                suffixIcons: Icons.visibility_off,
                hintext: "Password",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomeTextFieldPAss(
                isSameController: _passwordController,
                errorText: "Both password must match",
                // validator: (value) {
                //   if (_passwordController.text == value) {
                //     return "Both password must match";
                //   }
                //   return null;
                // },
                validator: (value) {
                  if (value == null ||
                      value.length < 8 ||
                      _passwordController.text != value) {
                    return "Both password must match";
                  }
                  return null;
                },

                textInputType: TextInputType.visiblePassword,
                controller: _verfiyPasswordController,
                prefixImage: Image.asset(
                  "assets/image/icons/lock.png",
                  color: const Color(0xff9CA3AF),
                  scale: 2.2,
                ),
                // prefixIcons: Icons.lock_outline_rounded,
                suffixIcons: Icons.visibility_off,
                hintext: "Verify Password",
              ),
              const SizedBox(height: 20),

              // const SizedBox(
              //   height: 270,
              // ),

              const Spacer(),

              CustomElvatedButton(
                text: const Text(
                  "Reset password",
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
                    builder: (context) => PasswordChangedSuccesfully(),
                  ));
                },
              ),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
