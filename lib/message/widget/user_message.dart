import 'package:flutter/material.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          constraints: const BoxConstraints(minWidth: 100, maxWidth: 275),
          decoration: const BoxDecoration(
              color: Color(0xff3366FF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )),
          child: Padding(
            padding: const EdgeInsets.all((10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                  strutStyle: const StrutStyle(height: 1.3),
                  // style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "10.18",
                      style: TextStyle(color: Color(0xffE5E7EB), fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
