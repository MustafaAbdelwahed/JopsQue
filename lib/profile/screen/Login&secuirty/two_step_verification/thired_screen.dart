import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/home/bottom_navigation_bar_item.dart';
import 'package:graduated_project/profile/screen/Login&secuirty/two_step_verification/widget/custom_otp.dart';
import 'package:graduated_project/profile/screen/login_and_security_screen.dart';
import 'package:graduated_project/profile/screen/profile_screen.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';
import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

class TwostepVerifyThiredScreen extends StatefulWidget {
  TwostepVerifyThiredScreen({super.key});
  // final TextEditingController _phoneController = TextEditingController();
  @override
  State<TwostepVerifyThiredScreen> createState() =>
      _TwostepVerifyThiredScreenState();
}

class _TwostepVerifyThiredScreenState extends State<TwostepVerifyThiredScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool isVisible = true;
  bool isSelected = true;
  String? dialingCode = "20";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Two-step verification",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Enter the 6 digit code",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Please confirm your account by entering the authorization code sen to ****-****-7234",
              style: TextStyle(color: Color(0xff6B7280)),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formKey,
              child: CustomOTP(pinController: _otpController),
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            Consumer(builder: (context, ref, _) {
              return CustomElvatedButton(
                onpress: () {
                  formKey.currentState!.validate();

                  print(_otpController.text);
                  ref.read(providerr).verifyde();
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //       builder: (context) => ProfileScreen(),
                  //     ),
                  //     (route) => false);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("is Avtive")));
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BootomNavigator(selectedIndex: 4),
                  ));
                },
                text: const Text("Send Code"),
              );
            })
          ],
        ),
      ),
    );
  }
}

// class CustomTextFieldPhone extends StatefulWidget {
//   CustomTextFieldPhone(
//       {super.key, required this.dialingCode, required this.phoneController});
//   final TextEditingController phoneController;
//   String? dialingCode;
//   @override
//   State<CustomTextFieldPhone> createState() => _CustomTextFieldPhoneState();
// }

// class _CustomTextFieldPhoneState extends State<CustomTextFieldPhone> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomeTextField(
//       cursorColor: const Color.fromARGB(255, 216, 114, 114),
//       // validator: (value) {
//       //   if (value == null || value.isEmpty) {
//       //     return 'This Field is Require';
//       //   } else if (value.length < 9) {
//       //     return 'Enter The correct number ';
//       //   } else {
//       //     return null;
//       //   }
//       // },
//       controller: widget.phoneController,
//       prefixIcons: PopupMenuButton(
//         onSelected: (value) {
//           setState(() {
//             widget.dialingCode = value;
//           });
//         },
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         itemBuilder: (context) => [
//           PopupMenuItem(
//             value: "20",
//             child: Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   "assets/image/flags/square egypt.png",
//                   width: 30,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 const Text("(+20)")
//               ],
//             ),
//           ),
//           PopupMenuItem(
//             value: "966",
//             child: Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   "assets/image/flags/square Saudi Arabia flag.jpg",
//                   width: 30,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 const Text("(+966)")
//               ],
//             ),
//           ),
//           PopupMenuItem(
//             value: "1",
//             child: Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   "assets/image/flags/square United States.png",
//                   width: 30,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 const Text("(+1)")
//               ],
//             ),
//           ),
//         ],
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               widget.dialingCode == "966"
//                   ? Image.asset(
//                       "assets/image/flags/square Saudi Arabia flag.jpg",
//                       width: 30,
//                     )
//                   : widget.dialingCode == "1"
//                       ? Image.asset(
//                           "assets/image/flags/square United States.png",
//                           width: 30,
//                         )
//                       : Image.asset(
//                           "assets/image/flags/square egypt.png",
//                           width: 30,
//                         ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Image.asset(
//                 "assets/image/icons/arrow-down.png",
//                 height: 20,
//                 width: 20,
//                 color: Colors.black,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
