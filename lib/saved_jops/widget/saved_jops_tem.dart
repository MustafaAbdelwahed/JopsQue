import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/apply_jop/apply_jop_screen.dart';
import 'package:graduated_project/model/jops.dart';
import 'package:graduated_project/provider/provider.dart';

class SavedJopsItem extends StatelessWidget {
  SavedJopsItem({super.key, required this.jop});

  final Jops jop;
  late final List listLocation = jop.location.split(" ");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          context: context,
          builder: (context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              height: 200,
              // height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ApplyJopScreen(jop: jop),
                      ));
                    },
                    child: BottomSheetItem(
                      title: "Apply Job",
                      image: Image.asset(
                        color: Colors.black,
                        "assets/image/icons/directbox-notif.png",
                        height: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO Share Jop
                    },
                    child: BottomSheetItem(
                      title: "Share via...",
                      image: Image.asset(
                        "assets/image/icons/export.png",
                        color: Colors.black,
                        height: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer(builder: (context, ref, _) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        jop.isSaved = false;
                        ref.read(providerr).unsaveJop(jop);
                      },
                      child: BottomSheetItem(
                        title: "Cancel save",
                        image: Image.asset(
                          color: Colors.black,
                          "assets/image/icons/archive-minus.png",
                          height: 25,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        );
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
                Image.asset(
                  "assets/image/icons/more.png",
                  height: 26,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text("Posted 2 days ago"),
                const Spacer(),
                Image.asset("assets/image/icons/clock.png"),
                const SizedBox(
                  width: 5,
                ),
                const Text("Be an early applicant"),
              ],
            ),
            const SizedBox(
              height: 10,
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

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final Image image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color(0xffD1D5DB),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            image,
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Image.asset(
              "assets/image/icons/arrow-right.png",
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
