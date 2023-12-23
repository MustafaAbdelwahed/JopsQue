// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldCustome extends StatelessWidget {
  TextFieldCustome(
      {super.key,
      required this.prefixIcons,
      this.suffixIcons,
      required this.hintext,
      this.isPass = false,
      required this.controller,
      required this.textInputType});

  final IconData prefixIcons;
  IconData? suffixIcons;
  final String hintext;
  final TextEditingController controller;
  bool isPass;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      obscureText: isPass ? true : false,
      decoration: InputDecoration(
        prefixIconColor: const Color(0xff9ca3af),
        suffixIconColor: const Color.fromARGB(255, 97, 101, 109),
        // focusColor: Color.fromARGB(255, 51, 255, 78),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff3366FF)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD1D5DB)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        prefixIcon: Icon(prefixIcons),
        suffixIcon: isPass
            ? IconButton(onPressed: () {}, icon: Icon(suffixIcons))
            : null,
        hintText: hintext,
      ),
    );
  }
}
