import 'package:flutter/material.dart';

class WorkInterestedItem extends StatefulWidget {
  const WorkInterestedItem({
    super.key,
    required this.interestedName,
    required this.interestedeIcon,
  });
  final String interestedName;
  final AssetImage interestedeIcon;
  @override
  State<WorkInterestedItem> createState() => _WorkInterestedItemState();
}

class _WorkInterestedItemState extends State<WorkInterestedItem> {
  Color containerColor = const Color(0xffD1D5DB).withOpacity(0.2);
  Color borderColor = const Color(0xffD1D5DB);
  Color iconColor = const Color(0xff292d32);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Change the color when the container is tapped
        setState(() {
          containerColor =
              containerColor == const Color(0xff3366FF).withOpacity(0.15)
                  ? const Color(0xffD1D5DB).withOpacity(0.2)
                  : const Color(0xff3366FF).withOpacity(0.15);

          borderColor = borderColor == const Color(0xff3366FF)
              ? const Color(0xffD1D5DB)
              : const Color(0xff3366FF);

          iconColor = iconColor == const Color(0xff3366FF)
              ? const Color(0xff292d32)
              : const Color(0xff3366ff);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        // width: 156,
        // height: 125,
        margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1.5, color: borderColor),
          color: containerColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(200)),
                    child:
                        Image(color: iconColor, image: widget.interestedeIcon)),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  widget.interestedName,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
