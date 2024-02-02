import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/profile/screen/Login&secuirty/change_password_screen.dart';
import 'package:graduated_project/profile/screen/Login&secuirty/email_adress_screen.dart';
import 'package:graduated_project/profile/screen/Login&secuirty/phone_number_screen.dart';
import 'package:graduated_project/profile/screen/Login&secuirty/two_step_verification/first_screen.dart';
import 'package:graduated_project/provider/provider.dart';

class LoginAndSecurityScreen extends StatelessWidget {
  LoginAndSecurityScreen({super.key});

  List<String> accontAccess = [
    "Email address",
    "Phone number",
    "Change password",
    "Two-step verification",
    "Face ID",
  ];
  // String email = "";
  // List<Widget>? onPress = [
  //   EmailAdressScreen(),
  //   PhoneNumberScreen(),
  //   ChangePasswordScreen(),
  //    TwostepVerifyFirstScreen(isShacked: ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login and security"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                color: const Color(0xffE5E7EB),
                width: double.infinity,
                height: 40,
                child: const Text(
                  "Accont access",
                  style: TextStyle(fontSize: 16, color: Color(0xff6B7280)),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(builder: (context, ref, _) {
                List<Widget>? onPress = [
                  EmailAdressScreen(),
                  PhoneNumberScreen(),
                  ChangePasswordScreen(),
                  TwostepVerifyFirstScreen(
                      isShacked: ref.read(providerr).isTsvVerify),
                ];
                return ListView.separated(
                  itemCount: accontAccess.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if (index != 4) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => onPress[index],
                          ));
                        }
                      },
                      leading: Text(
                        accontAccess[index],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          index == 0
                              ? Text(
                                  ref.watch(providerr).user!.email!,
                                  style: TextStyle(
                                    // fontSize: 16,
                                    color: Color(0xff6B7280),
                                  ),
                                )
                              : index == 3
                                  ? Text(
                                      ref.watch(providerr).isTsvVerify
                                          ? "Active"
                                          : "Non active",
                                      style: TextStyle(
                                        // fontSize: 16,
                                        color: Color(0xff6B7280),
                                      ),
                                    )
                                  : const Text(""),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            "assets/image/icons/right.png",
                            color: Colors.black,
                            width: 20,
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    indent: 15,
                    endIndent: 20,
                    thickness: 1.5,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
