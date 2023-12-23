import 'package:flutter/material.dart';

class Logos extends StatelessWidget {
  const Logos({
    super.key,
    required this.image,
    required this.text,
  });
  final AssetImage image;
  final Text text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffD1D5DB)),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 46,
      width: 154,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: image),
          const SizedBox(
            width: 8,
          ),
          text,
        ],
      ),
    );
  }
}
