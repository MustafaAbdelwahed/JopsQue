import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/model/jops.dart';
import 'package:graduated_project/provider/provider.dart';

class SavedIcon extends StatefulWidget {
  const SavedIcon({
    super.key,
    required this.jops,
  });
  final Jops jops;
  @override
  State<SavedIcon> createState() => _SavedIconState();
}

class _SavedIconState extends State<SavedIcon> {
  late bool isSaved;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return GestureDetector(
        onTap: () {
          if (widget.jops.isSaved) {
            ref.watch(providerr).unsaveJop(widget.jops);
          } else {
            ref.watch(providerr).savedJop(widget.jops);
          }
          setState(() {});
        },
        child: Image.asset(
            widget.jops.isSaved
                ? "assets/image/icons/archive-minus_bold.png"
                : "assets/image/icons/archive-minus.png",
            height: 25,
            color:
                widget.jops.isSaved ? const Color(0xff3366ff) : Colors.black),
      );
    });
  }
}
