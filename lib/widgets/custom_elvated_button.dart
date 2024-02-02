import 'package:flutter/material.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton({
    super.key,
    required this.onpress,
    this.color,
    required this.text,
  });

  final VoidCallback onpress;
  final Color? color;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ButtonStyle(
        shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)))),
        minimumSize: const MaterialStatePropertyAll(Size(327, 48)),
        backgroundColor:
            MaterialStatePropertyAll(color ?? const Color(0xff3366FF)),
      ),
      child: text,
    );
  }
}
