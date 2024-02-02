import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';
import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});
  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController _phoneController = TextEditingController();

  bool isSelected = false;
  String? phone = "20";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone number"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: Consumer(builder: (context, ref, _) {
          // widget._phoneController.text =
          //     ref.read(providerr).user!.phone ?? "".trim();
          _phoneController.text = ref.read(providerr).user!.phone ?? "";
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Main phone number",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(
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
                controller: _phoneController,
                prefixIcons: PopupMenuButton(
                  onSelected: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
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
                        phone == "966"
                            ? Image.asset(
                                "assets/image/flags/square Saudi Arabia flag.jpg",
                                width: 30,
                              )
                            : phone == "1"
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
              ),
              const SizedBox(
                height: 10,
              ),
              SwitchListTile.adaptive(
                title: const Text(
                  "Use the phone number to reset your password",
                  style: TextStyle(fontSize: 14, color: Color(0xff6B7280)),
                ),
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    isSelected = value;
                  });
                },
              ),
              const Spacer(),
              CustomElvatedButton(
                  onpress: () {
                    ref.read(providerr).user!.phone = _phoneController.text;
                    ref.watch(providerr).editUser();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("changed successfully")));
                    Navigator.of(context).pop();
                  },
                  text: const Text("Save"))
            ],
          );
        }),
      ),
    );
  }
}
