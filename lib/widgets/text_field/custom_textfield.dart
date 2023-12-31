// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  CustomeTextField(
      {super.key,
      this.prefixIcons,
      this.suffixIcons,
      this.hintext,
      this.isPass = false,
      required this.controller,
      required this.textInputType,
      this.prefixImage,
      this.borderRadius,
      this.borderColor,
      this.cursorColor});

  final Color? borderColor;
  final Color? cursorColor;
  final double? borderRadius;
  final IconData? prefixIcons;
  final Image? prefixImage;
  IconData? suffixIcons;
  final String? hintext;
  final TextEditingController controller;
  bool isPass;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColor ?? const Color(0xff3366FF),
      keyboardType: textInputType,
      controller: controller,
      obscureText: isPass ? true : false,
      decoration: InputDecoration(
        prefixIconColor: const Color(0xff9ca3af),
        suffixIconColor: const Color.fromARGB(255, 97, 101, 109),
        // focusColor: Color.fromARGB(255, 51, 255, 78),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? const Color(0xff3366FF)),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8))),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? const Color(0xffD1D5DB)),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8))),
        prefixIcon: prefixIcons != null ? Icon(prefixIcons) : prefixImage,
        suffixIcon: isPass
            ? IconButton(onPressed: () {}, icon: Icon(suffixIcons))
            : null,
        hintText: hintext,
      ),
    );
  }
}
