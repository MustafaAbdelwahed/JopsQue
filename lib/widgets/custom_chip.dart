// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.text,
    this.chipColor,
    this.textColor,
    this.image,
  });

  final String text;
  final Color? chipColor;
  final Color? textColor;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 88,
      decoration: BoxDecoration(
          color: chipColor ?? const Color(0xffD6E4FF),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor ?? const Color(0xff3366FF),
            ),
          ),
        ],
      )),
    );
  }
}

class CustomChipWithArrow extends StatelessWidget {
  const CustomChipWithArrow({
    super.key,
    required this.text,
    this.chipColor,
    this.textColor,
    required this.image,
  });

  final String text;
  final Color? chipColor;
  final Color? textColor;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 94,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffD1D5DB)),
          color: chipColor ?? const Color(0xffD6E4FF),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: textColor ?? const Color(0xff3366FF),
            ),
          ),
          image
        ],
      )),
    );
  }
}
