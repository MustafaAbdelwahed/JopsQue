import 'package:flutter/material.dart';
import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

class BiodataScreen extends StatefulWidget {
  const BiodataScreen({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  });
  final TextEditingController nameController;

  final TextEditingController emailController;

  final TextEditingController phoneController;
  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  String? phone = "20";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Biodata",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Fill in your bio data correctly",
          style: TextStyle(
            color: Color(
              0xff6B7280,
            ),
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
          text: const TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(text: "Full Name "),
                TextSpan(text: "*", style: TextStyle(color: Colors.red))
              ]),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomeTextField(
          cursorColor: const Color.fromARGB(255, 216, 114, 114),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This Field is Require';
            } else {
              return null;
            }
          },
          prefixIcons: const Icon(Icons.person_outlined),
          controller: widget.nameController,
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
          text: const TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(text: "Email "),
                TextSpan(text: "*", style: TextStyle(color: Colors.red))
              ]),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomeTextField(
          cursorColor: const Color.fromARGB(255, 216, 114, 114),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This Field is Require';
            } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
              return 'Enter a Correct Email';
            } else {
              return null;
            }
          },
          prefixIcons: const Icon(Icons.email_outlined),
          controller: widget.emailController,
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
          text: const TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(text: "No.Handphone "),
                TextSpan(text: "*", style: TextStyle(color: Colors.red))
              ]),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomeTextField(
          cursorColor: const Color.fromARGB(255, 216, 114, 114),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This Field is Require';
            } else if (value.length < 9) {
              return 'Enter The correct number ';
            } else {
              return null;
            }
          },
          controller: widget.phoneController,
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
                    )
                  ],
                ),
              )),
        ),
      ]),
    );
  }
}
