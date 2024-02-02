// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DialingCode extends StatefulWidget {
  const DialingCode({super.key});

  @override
  State<DialingCode> createState() => _DialingCodeState();
}

class _DialingCodeState extends State<DialingCode> {
  String? phone = "20";
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        setState(() {
          phone = value;
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
    );
  }
}
