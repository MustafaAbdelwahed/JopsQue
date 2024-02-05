// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomeTextField extends StatefulWidget {
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
      // this.prefixIconsButton,
      this.validator,
      this.sufixImage});

  final Color? borderColor;
  final Color? cursorColor;
  final double? borderRadius;
  final Widget? prefixIcons;
  // final IconButton? prefixIconsButton;
  final Image? prefixImage;
  final Image? sufixImage;
  final Widget? suffixIcons;
  final String? hintext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  bool isPass;

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontWeight: FontWeight.w500),
      // keyboardType: TextInputType.name,
      validator: widget.validator,
      // cursorColor: cursorColor ?? const Color(0xff3366FF),
      controller: widget.controller,

      obscureText: widget.isPass ? true : false,
      decoration: InputDecoration(
        prefixIconColor: const Color(0xff9ca3af),
        suffixIconColor: const Color.fromARGB(255, 97, 101, 109),
        // //error

        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(8))),

        // errorStyle: TextStyle(
        //     fontWeight: FontWeight.w400, color: errorColor(controller)),
        // //End error

        // focusColor: Color.fromARGB(255, 51, 255, 78),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor ?? const Color(0xff3366FF)),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 8))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor ?? const Color(0xffD1D5DB)),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 8))),
        prefixIcon: widget.prefixIcons ?? widget.prefixImage,
        suffixIcon: widget.suffixIcons,
        // isPass
        //     ? IconButton(onPressed: () {}, icon: Icon(suffixIcons))
        //     : null,,

        hintText: widget.hintext,
      ),
    );
  }
}
