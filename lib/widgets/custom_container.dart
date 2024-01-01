// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:graduated_project/widgets/custom_chip.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/image/just image/Twitter Logo.png",
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Designer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Zoom • United States',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset('assets/image/icons/Vector.png', color: Colors.black)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisSize: MainAxisSize.min,
            children: [
              CustomChip(
                text: "Senior",
              ),
              const Spacer(),
              CustomChip(
                text: "Fulltime",
              ),
              const Spacer(),
              CustomChip(
                text: "Remote",
              ),
              const Spacer(
                flex: 4,
              ),
              const Text(
                "\$15K",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2E8E18)),
              ),
              const Text(
                "/Month",
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B7280)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 1.5,
          )
        ],
      ),
    );
  }
}
