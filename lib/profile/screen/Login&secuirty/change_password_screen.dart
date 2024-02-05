import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';
import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isOldPassVis = true;
  bool isNewPassVis = true;
  bool isConfirmPassVis = true;
  AppBar appbar = AppBar(
    title: const Text("Change password"),
  );
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size.height;
    var notifySize = MediaQuery.of(context).padding.top;
    var appBarSize = appbar.preferredSize.height;
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Container(
          height: pageSize - (appBarSize + notifySize),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Enter your old password",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(
                  controller: _oldPasswordController,
                  prefixImage: Image.asset(
                    "assets/image/icons/lock.png",
                    color: const Color(0xff9ca3af),
                    scale: 2.5,
                  ),
                  suffixIcons: GestureDetector(
                    onTap: () {
                      setState(() {
                        isOldPassVis = !isOldPassVis;
                      });
                    },
                    child: Image.asset(
                      isOldPassVis
                          ? "assets/image/icons/eye-slash.png"
                          : "assets/image/icons/eye.png",
                      color: const Color(0xff9ca3af),
                      scale: 2.5,
                    ),
                    //  Icon(isConfirmPassVis
                    //     ? Icons.visibility_off
                    //     : Icons.visibility))
                  ),
                  // hintext: "Password",
                  isPass: isOldPassVis),

              const SizedBox(
                height: 20,
              ),
              //////////////////////////
              const Text("Enter your new password",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(
                  controller: _newPasswordController,
                  prefixImage: Image.asset(
                    "assets/image/icons/lock.png",
                    color: const Color(0xff9ca3af),
                    scale: 2.5,
                  ),
                  suffixIcons: GestureDetector(
                    onTap: () {
                      setState(() {
                        isNewPassVis = !isNewPassVis;
                      });
                    },
                    child: Image.asset(
                      isNewPassVis
                          ? "assets/image/icons/eye-slash.png"
                          : "assets/image/icons/eye.png",
                      color: const Color(0xff9ca3af),
                      scale: 2.5,
                    ),
                    //  Icon(isConfirmPassVis
                    //     ? Icons.visibility_off
                    //     : Icons.visibility))
                  ),
                  // hintext: "Password",
                  isPass: isNewPassVis),
              const SizedBox(
                height: 20,
              ),
              //////////////////////////////
              const Text("Confirm your new password",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(
                  controller: _confirmPasswordController,
                  prefixImage: Image.asset(
                    "assets/image/icons/lock.png",
                    color: const Color(0xff9ca3af),
                    scale: 2.5,
                  ),
                  suffixIcons: GestureDetector(
                    onTap: () {
                      setState(() {
                        isConfirmPassVis = !isConfirmPassVis;
                      });
                    },
                    child: Image.asset(
                      isConfirmPassVis
                          ? "assets/image/icons/eye-slash.png"
                          : "assets/image/icons/eye.png",
                      color: const Color(0xff9ca3af),
                      scale: 2.5,
                    ),
                    //  Icon(isConfirmPassVis
                    //     ? Icons.visibility_off
                    //     : Icons.visibility))
                  ),
                  // hintext: "Password",
                  isPass: isConfirmPassVis),

              // const SizedBox(
              //   height: 20,
              // ),
              // const Spacer(),
              const Expanded(
                child: SizedBox(
                    // height: 250,
                    ),
              ),
              Consumer(builder: (context, ref, _) {
                return CustomElvatedButton(
                    onpress: () {
                      if (_newPasswordController.text ==
                          _confirmPasswordController.text) {
                        ref.read(providerr).user?.password =
                            _newPasswordController.text;
                        ref.watch(providerr).changePassword();
                        Navigator.of(context).pop();
                      } else {}
                    },
                    text: const Text("Save"));
              })
            ],
          ),
        ),
      ),
    );
  }
}
