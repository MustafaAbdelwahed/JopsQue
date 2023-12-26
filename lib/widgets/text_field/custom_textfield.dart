// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  CustomeTextField(
      {super.key,
      required this.prefixIcons,
      this.suffixIcons,
      required this.hintext,
      required this.controller,
      required this.textInputType});

  final IconData prefixIcons;
  IconData? suffixIcons;
  final String hintext;
  final TextEditingController controller;

  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        prefixIconColor: const Color(0xff9ca3af),

        // focusColor: Color.fromARGB(255, 51, 255, 78),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff3366FF)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD1D5DB)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        prefixIcon: Icon(prefixIcons),

        hintText: hintext,
      ),
    );
  }
}
