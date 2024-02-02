import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  List notificationTilesn = [
    "Dana,",
    "Shoope,",
    "Slack,",
    "Facebook,",
  ];
  List notificationSubtilesn = [
    "Posted new design jobs,",
    "Posted new design jobs,",
    "Posted new design jobs,",
    "Posted new design jobs,",
  ];

  List notificationImagesn = [
    "assets/image/image Company/Dana Logo.png",
    "assets/image/image Company/Shoope Logo.png",
    "assets/image/image Company/Slack Logo.png",
    "assets/image/image Company/Facebook Logo.png",
  ];
  List notificationTilesy = [
    "setup,",
    "Welcome to Jobsque,",
  ];
  List notificationSubtilesy = [
    "Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.",
    "Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....",
  ];
  List notificationImagesy = [
    "assets/image/icons/Email.png",
    "assets/image/icons/Jobsque Logo.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
              color: const Color.fromARGB(255, 234, 234, 236),
              width: double.infinity,
              height: 30,
              child: const Text(
                "New",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B7280),
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shrinkWrap: true,
                itemBuilder: (context, index) => NotificationItem(
                    titile: notificationTilesn[index],
                    subTitile: notificationSubtilesn[index],
                    image: notificationImagesn[index]),
                separatorBuilder: (context, index) => const Divider(
                      thickness: 1.2,
                    ),
                itemCount: notificationTilesn.length),
            // const SizedBox(
            //   height: 20,
            // ),
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
              color: const Color.fromARGB(255, 234, 234, 236),
              width: double.infinity,
              height: 30,
              child: const Text(
                "Yesterday",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B7280),
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shrinkWrap: true,
                itemBuilder: (context, index) => NotificationItem(
                    titile: notificationTilesy[index],
                    subTitile: notificationSubtilesy[index],
                    image: notificationImagesy[index]),
                separatorBuilder: (context, index) => const Divider(
                      thickness: 1.2,
                    ),
                itemCount: notificationTilesy.length),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.titile,
    required this.subTitile,
    required this.image,
  });

  final String titile;
  final String subTitile;
  final String image;
  @override
  Widget build(BuildContext context) {
    return
        // SizedBox(
        //   child: Row(
        //     children: [
        //       ClipRRect(
        //           borderRadius: BorderRadius.circular(100),
        //           // radius: 80,

        //           child: Image.asset(
        //             image,
        //             height: 40,
        //           )),
        //       SizedBox(
        //         width: 10,
        //       ),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(bottom: 5),
        //             child: Text(
        //               titile,
        //               style: const TextStyle(
        //                   fontSize: 14, fontWeight: FontWeight.w500),
        //             ),
        //           ),
        //           Expanded(
        //             child: Text(subTitile,
        //                 maxLines: 2,
        //                 style: const TextStyle(
        //                   overflow: TextOverflow.ellipsis,
        //                   fontSize: 12,
        //                 )),
        //           ),
        //         ],
        //       ),
        //       // Text(
        //       //   "•",
        //       //   style: TextStyle(fontSize: 50, color: Color(0xffDBB40E)),
        //       // ),
        //       // // Image.asset(
        //       // //   "assets/image/icons/dot.png",
        //       // //   height: 10,
        //       // //   width: 10,
        //       // // ),
        //       // Text(
        //       //   " 10.00AM",
        //       //   style: TextStyle(fontSize: 12, color: Color(0xff6B7280)),
        //       // )
        //     ],
        //   ),
        ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          // radius: 80,

          child: Image.asset(
            image,
            height: 40,
          )),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          titile,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      subtitle: Text(subTitile,
          maxLines: 2,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 12,
          )),
      trailing: const Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "•",
            style: TextStyle(fontSize: 50, color: Color(0xffDBB40E)),
          ),
          // Image.asset(
          //   "assets/image/icons/dot.png",
          //   height: 10,
          //   width: 10,
          // ),
          Text(
            " 10.00AM",
            style: TextStyle(fontSize: 12, color: Color(0xff6B7280)),
          )
        ],
      ),
    );
  }
}
