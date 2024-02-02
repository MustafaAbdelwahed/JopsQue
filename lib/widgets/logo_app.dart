import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/image/logo/Logo.png",
      width: width,
      height: height,
      // fit: BoxFit.cover,
    );
  }
}
