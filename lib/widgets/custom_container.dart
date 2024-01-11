// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:graduated_project/jop_detail/jop_detail_screen.dart';
import 'package:graduated_project/model/jops.dart';
import 'package:graduated_project/widgets/custom_chip.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    required this.jops,
  });
  final Jops jops;

  late List listLocation = jops.location.split(" ");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => JopDetailScreen(jops: jops),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                  jops.image,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jops.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${jops.compName} • ${listLocation[listLocation.length - 2]} ${listLocation.last} ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Image.asset('assets/image/icons/Vector.png',
                    color: Colors.black)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                CustomChip(
                  text: jops.jobTimeType,
                ),
                const Spacer(),
                CustomChip(
                  text: jops.jobType,
                ),
                const Spacer(
                  flex: 10,
                ),
                // const Spacer(
                //   flex: 4
                // ),
                Text(
                  jops.salary.length > 3
                      ? "\$${(int.parse(jops.salary) ~/ 1000)}K "
                      : "\$${jops.salary} ",
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
      ),
    );
  }
}
