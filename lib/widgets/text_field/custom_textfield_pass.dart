// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomeTextFieldPAss extends StatelessWidget {
  CustomeTextFieldPAss(
      {super.key,
      required this.prefixIcons,
      this.suffixIcons,
      required this.hintext,
      this.isPass = false,
      required this.controller,
      required this.textInputType,
      required this.validator});

  final IconData prefixIcons;
  IconData? suffixIcons;
  final String hintext;
  final TextEditingController controller;
  bool isPass;
  final TextInputType? textInputType;

  final List<Color> _color = [
    const Color(0xffD1D5DB),
    const Color(0xff9CA3AF),
    const Color(0xffFF472B),
    const Color(0xff60C631),
    const Color(0xff3366FF),
  ];
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      // style: TextStyle(fontSize: 20),
      keyboardType: textInputType,
      controller: controller,
      obscureText: isPass ? true : false,
      decoration: InputDecoration(
        //error
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: controller.text.length < 8 ? _color[2] : _color[4]),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor(controller)),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        errorText: "Password must be at least 8 characters",

        errorStyle: TextStyle(
            fontWeight: FontWeight.w400, color: errorColor(controller)),
        //prefix
        prefixIcon: Icon(prefixIcons),
        prefixIconColor: const Color(0xff9ca3af),
        // focusColor: Color.fromARGB(255, 51, 255, 78),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff3366FF)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD1D5DB)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        //suffix
        suffixIcon: isPass
            ? IconButton(onPressed: () {}, icon: Icon(suffixIcons))
            : null,
        suffixIconColor: const Color.fromARGB(255, 97, 101, 109),

        hintText: hintext,
      ),
    );
  }

  Color errorColor(TextEditingController controller) {
    Color thatColor;
    if (controller.text.isEmpty) {
      thatColor = _color[1];
    } else {
      if (controller.text.length < 8 && controller.text.isNotEmpty) {
        thatColor = _color[2];
      } else {
        thatColor = _color[3];
      }
    }
    return thatColor;
  }

  Color borderColor(TextEditingController controller) {
    Color thatColor;
    if (controller.text.isEmpty) {
      thatColor = _color[0];
    } else {
      if (controller.text.length < 8 || controller.text.isEmpty) {
        thatColor = _color[2];
      } else {
        thatColor = _color[0];
      }
    }
    return thatColor;
  }
}

//  Color errorColor(TextEditingController controller) {
//     Color thatColor;
//     if (controller.text.isEmpty && isFirstTime) {
//       thatColor = _color[0];
//       isFirstTime = false;
//     } else {
//       if (controller.text.length < 8 || controller.text.isEmpty) {
//         thatColor = _color[2];
//       } else {
//         thatColor = _color[0];
//       }
//     }
//     return thatColor;
//   }
//   Color borderColor(TextEditingController controller) {
//     Color thatColor;
//     if (controller.text.isEmpty && isFirstTime) {
//       thatColor = _color[0];
//       isFirstTime = false;
//     } else {
//       if (controller.text.length < 8 || controller.text.isEmpty) {
//         thatColor = _color[2];
//       } else {
//         thatColor = _color[0];
//       }
//     }
//     return thatColor;
//   }