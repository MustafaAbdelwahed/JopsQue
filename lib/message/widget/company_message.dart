import 'package:flutter/material.dart';

class CompanyMessage extends StatelessWidget {
  const CompanyMessage({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          // width: 275,

          constraints: const BoxConstraints(minWidth: 100, maxWidth: 275),
          decoration: const BoxDecoration(
            color: const Color(0xffE5E7EB),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all((10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  text,
                  strutStyle: const StrutStyle(height: 1.3),
                  // style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 10),
                const Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    "10.18",
                    style: TextStyle(color: Color(0xff9CA3AF), fontSize: 12),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
