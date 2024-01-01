// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  CustomChip({
    super.key,
    required this.text,
    this.isCard = false,
  });
  final bool isCard;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
          color: isCard ? Colors.white24 : const Color(0xffD6E4FF),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
          child: Text(
        text,
        style:
            TextStyle(color: isCard ? Colors.white : const Color(0xff3366FF)),
      )),
    );
  }
}
