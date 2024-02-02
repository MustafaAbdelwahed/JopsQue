import 'package:flutter/material.dart';
import 'package:graduated_project/profile/screen/Login&secuirty/two_step_verification/thired_screen.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';
import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

class TwostepVerifySecoundScreen extends StatefulWidget {
  TwostepVerifySecoundScreen({super.key});
  final TextEditingController _phoneController = TextEditingController();
  @override
  State<TwostepVerifySecoundScreen> createState() =>
      _TwostepVerifySecoundScreenState();
}

class _TwostepVerifySecoundScreenState
    extends State<TwostepVerifySecoundScreen> {
  final TextEditingController _passwordsController = TextEditingController();
  bool isVisible = true;
  bool isSelected = true;
  String? dialingCode = "20";
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
              "Add phone number",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "We will send a verification code to this number",
              style: TextStyle(color: Color(0xff6B7280)),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFieldPhone(
              dialingCode: dialingCode,
              phoneController: widget._phoneController,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Enter your password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomeTextField(
                controller: _passwordsController,
                prefixImage: Image.asset(
                  "assets/image/icons/lock.png",
                  color: const Color(0xff9ca3af),
                  scale: 2.5,
                ),
                suffixIcons: GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Image.asset(
                    isVisible
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
                isPass: isVisible),
            const Spacer(),
            CustomElvatedButton(
                onpress: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => TwostepVerifyThiredScreen(),
                      ),
                      (route) => false);
                },
                text: const Text("Send Code"))
          ],
        ),
      ),
    );
  }
}

class CustomTextFieldPhone extends StatefulWidget {
  CustomTextFieldPhone(
      {super.key, required this.dialingCode, required this.phoneController});
  final TextEditingController phoneController;
  String? dialingCode;
  @override
  State<CustomTextFieldPhone> createState() => _CustomTextFieldPhoneState();
}

class _CustomTextFieldPhoneState extends State<CustomTextFieldPhone> {
  @override
  Widget build(BuildContext context) {
    return CustomeTextField(
      cursorColor: const Color.fromARGB(255, 216, 114, 114),
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'This Field is Require';
      //   } else if (value.length < 9) {
      //     return 'Enter The correct number ';
      //   } else {
      //     return null;
      //   }
      // },
      controller: widget.phoneController,
      prefixIcons: PopupMenuButton(
        onSelected: (value) {
          setState(() {
            widget.dialingCode = value;
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: "20",
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/image/flags/square egypt.png",
                  width: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text("(+20)")
              ],
            ),
          ),
          PopupMenuItem(
            value: "966",
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/image/flags/square Saudi Arabia flag.jpg",
                  width: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text("(+966)")
              ],
            ),
          ),
          PopupMenuItem(
            value: "1",
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/image/flags/square United States.png",
                  width: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text("(+1)")
              ],
            ),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.dialingCode == "966"
                  ? Image.asset(
                      "assets/image/flags/square Saudi Arabia flag.jpg",
                      width: 30,
                    )
                  : widget.dialingCode == "1"
                      ? Image.asset(
                          "assets/image/flags/square United States.png",
                          width: 30,
                        )
                      : Image.asset(
                          "assets/image/flags/square egypt.png",
                          width: 30,
                        ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/image/icons/arrow-down.png",
                height: 20,
                width: 20,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
