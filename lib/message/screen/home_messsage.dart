import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/model/company.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/custom_search.dart';

import '../widget/message_items.dart';

class HomeMessageScreen extends StatelessWidget {
  HomeMessageScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  List nameOfCompany = [
    "Twitter",
    "Gojek Indonesia",
    "Shoope",
    "Dana",
    "Slack",
    "Facebook",
  ];
  List imageOfCompany = [
    "assets/image/just image/Twitter Logo.png",
    "assets/image/image Company/Gojek Logo.png",
    "assets/image/image Company/Shoope Logo.png",
    "assets/image/image Company/Dana Logo.png",
    "assets/image/image Company/Slack Logo.png",
    "assets/image/image Company/Facebook Logo.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messsages'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomSearch(
                  searchController: searchController,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          height: 300,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  "Message filters",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const BottomSheetItem(
                                    title: "Unread",
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const BottomSheetItem(
                                    title: "Spam",
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const BottomSheetItem(
                                    title: "Archived",
                                  ),
                                ),
                              ]),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(100)),
                    child: Image.asset(
                      "assets/image/icons/Filter.png",
                      height: 20,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              // height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  indent: 70,
                  endIndent: 3,
                  thickness: 1,
                ),
                itemCount: nameOfCompany.length,
                itemBuilder: (context, index) => MessageItems(
                  company: Company(
                      name: nameOfCompany[index], image: imageOfCompany[index]),
                ),
              ),
            ),
            // ChatItem(),
            // ChatItem()
            // BottomSheetItem(
            //   title: "Unread",
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
  });
  final String title;
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
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
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
