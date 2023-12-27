// ignore_for_file: must_be_immutable

import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomeTextFieldPAss extends StatefulWidget {
  const CustomeTextFieldPAss(
      {super.key,
      required this.prefixIcons,
      required this.suffixIcons,
      required this.hintext,
      required this.controller,
      required this.textInputType,
      this.validator,
      required this.errorText});

  //  Bool ispas;
  final IconData prefixIcons;
  final IconData? suffixIcons;
  final String hintext;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String errorText;

  final String? Function(String?)? validator;

  @override
  State<CustomeTextFieldPAss> createState() => _CustomeTextFieldPAssState();
}

class _CustomeTextFieldPAssState extends State<CustomeTextFieldPAss> {
  bool visible = false;

  final List<Color> _color = [
    const Color(0xffD1D5DB),
    const Color(0xff9CA3AF),
    const Color(0xffFF472B),
    const Color(0xff60C631),
    const Color(0xff3366FF),
  ];

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      // style: TextStyle(fontSize: 20),
      keyboardType: widget.textInputType,
      controller: widget.controller,
      obscureText: visible ? false : true,
      decoration: InputDecoration(
        //error
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    widget.controller.text.length < 8 ? _color[2] : _color[4]),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor(widget.controller)),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        errorText: widget.validator == null ? null : widget.errorText,

        errorStyle: TextStyle(
            fontWeight: FontWeight.w400, color: errorColor(widget.controller)),
        //prefix
        prefixIcon: Icon(widget.prefixIcons),
        prefixIconColor: const Color(0xff9ca3af),
        // focusColor: Color.fromARGB(255, 51, 255, 78),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff3366FF)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD1D5DB)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        //suffix
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
            icon: Icon(widget.suffixIcons)),
        suffixIconColor: const Color.fromARGB(255, 97, 101, 109),

        hintText: widget.hintext,
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