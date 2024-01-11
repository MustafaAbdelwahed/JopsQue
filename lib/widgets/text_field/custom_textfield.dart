// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  CustomeTextField(
      {super.key,
      this.prefixIcons,
      this.suffixIcons,
      this.hintext,
      this.isPass = false,
      required this.controller,
      this.prefixImage,
      this.borderRadius,
      this.borderColor,
      this.cursorColor,
      this.prefixIconsButton,
      this.validator});

  final Color? borderColor;
  final Color? cursorColor;
  final double? borderRadius;
  final Widget? prefixIcons;
  final IconButton? prefixIconsButton;
  final Image? prefixImage;
  IconData? suffixIcons;
  final String? hintext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  bool isPass;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontWeight: FontWeight.w500),
      validator: validator,
      // cursorColor: cursorColor ?? const Color(0xff3366FF),
      controller: controller,
      obscureText: isPass ? true : false,
      decoration: InputDecoration(
        prefixIconColor: const Color(0xff9ca3af),
        suffixIconColor: const Color.fromARGB(255, 97, 101, 109),
        // //error

        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: const BorderRadius.all(Radius.circular(8))),

        // errorStyle: TextStyle(
        //     fontWeight: FontWeight.w400, color: errorColor(controller)),
        // //End error

        // focusColor: Color.fromARGB(255, 51, 255, 78),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? const Color(0xff3366FF)),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8))),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? const Color(0xffD1D5DB)),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8))),
        prefixIcon: prefixIcons ?? (prefixImage ?? prefixIconsButton),
        suffixIcon: isPass
            ? IconButton(onPressed: () {}, icon: Icon(suffixIcons))
            : null,
        hintText: hintext,
      ),
    );
  }
}
