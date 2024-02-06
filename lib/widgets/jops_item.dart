import 'package:flutter/material.dart';
import 'package:graduated_project/jop_detail/jop_detail_screen.dart';
import 'package:graduated_project/model/jops.dart';
import 'package:graduated_project/widgets/custom_chip.dart';
import 'package:graduated_project/widgets/saved_icon.dart';

class JopsItem extends StatelessWidget {
  JopsItem({
    super.key,
    required this.jop,
  });
  final Jops jop;

  late final List listLocation = jop.location.split(" ");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => JopDetailScreen(jop: jop),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    jop.image,
                    width: 40,
                    height: 40,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jop.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${jop.compName} • ${listLocation[listLocation.length - 2]} ${listLocation.last} ",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SavedIcon(
                  jops: jop,
                )
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
                  text: jop.jobTimeType,
                ),
                const Spacer(),
                CustomChip(
                  text: jop.jobType,
                ),
                const Spacer(
                  flex: 10,
                ),
                // const Spacer(
                //   flex: 4
                // ),
                Text(
                  jop.salary.length > 3
                      ? "\$${(int.parse(jop.salary) ~/ 1000)}K "
                      : "\$${jop.salary} ",
                  style: const TextStyle(
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
            // const Divider(
            //   thickness: 1.5,
            // )
          ],
        ),
      ),
    );
  }
}
