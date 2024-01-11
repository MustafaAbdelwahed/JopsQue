import 'package:flutter/material.dart';
import 'package:graduated_project/model/jops.dart';

class JopDetailPeopleScreen extends StatelessWidget {
  const JopDetailPeopleScreen({super.key, required this.jops});
  final Jops jops;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Column(
                  children: [
                    Text(
                      "4 Employees For",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "UI/UX Design",
                      style: TextStyle(fontSize: 13, color: Color(0xff6B7280)),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 40,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      width: 2,
                      color: const Color(0xffD1D5DB),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "UI/UX Designer",
                        style: TextStyle(fontSize: 13),
                      ),
                      Image.asset(
                        "assets/image/icons/arrow-down.png",
                        height: 20,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 2,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              children: [
                CustomListTile(
                    title: "Dimas Adi Saputro",
                    subtitle: "Senior UI/UX Designer at Twitter",
                    image: "assets/image/profile/Dimas Profile.jpg"),
                CustomListTile(
                    title: "Farrel Adi Saputro",
                    subtitle: "Senior UI/UX Designer at Twitter",
                    image: "assets/image/profile/Farrel Profile.png"),
                CustomListTile(
                    title: "Dimas Adi Saputro",
                    subtitle: "Senior UI/UX Designer at Twitter",
                    image: "assets/image/profile/Syahrul Profile.png"),
                CustomListTile(
                    title: "Azzahra Adi Saputro",
                    subtitle: "UI/UX Designer at Twitter",
                    image: "assets/image/profile/Azzahra Profile.png"),
                SizedBox(
                  height: 55,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});
  final String title;
  final String subtitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        child: Image(
          image: AssetImage(image),
          height: 50,
          fit: BoxFit.fill,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12, color: Color(0xff6B7280)),
      ),
      trailing: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Work during",
            style: TextStyle(fontSize: 12, color: Color(0xff6B7280)),
          ),
          Text(
            "5 Years",
            style: TextStyle(fontSize: 12, color: Color(0xff3366FF)),
          ),
        ],
      ),
    );
  }
}
