// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:graduated_project/home/search_screen.dart';
import 'package:graduated_project/model/user.dart';

import '../widgets/custom_chip.dart';
import '../widgets/custom_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    this.user,
  });
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 39, right: 15, left: 15, bottom: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, diana👋",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Create a better future for yourself here",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xff6B7280)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: const Color(0xffD1D5DB)),
                          borderRadius: BorderRadius.circular(50)),
                      child: Image.asset("assets/image/icons/notification.png"),
                    )
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 12),
                    height: 48,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffD1D5DB)),
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/image/icons/search-normal.png",
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Search....",
                          style: TextStyle(color: Color(0xff9CA3AF)),
                        )
                      ],
                    ), // width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //TODO the First
                const Row(
                  children: [
                    Text(
                      "Suggested Job",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      "View all",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff3366FF)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomCard(),
                        CustomCard(),
                        CustomCard(),
                        CustomCard(),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                //TODO the secound
                const Row(
                  children: [
                    Text(
                      "Recent  Job",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      "View all",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff3366FF)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomContainer(),
                const CustomContainer(),
                const CustomContainer(),
                const CustomContainer(),
                const CustomContainer(),
                const CustomContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 205,
      width: 350,
      child: Card(
        // margin: const EdgeInsets.all(8),
        color: const Color(0xff091A7A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/image/just image/Zoom Logo.png",
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
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Zoom • United States',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff9CA3AF)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset('assets/image/icons/Vector.png')
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  CustomChip(text: "Fulltime", isCard: true),
                  CustomChip(text: "Remote", isCard: true),
                  CustomChip(text: "Senior", isCard: true),
                  // const Spacer(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "\$12K-15K",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const Text(
                    "/Month",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white54),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          minimumSize:
                              const MaterialStatePropertyAll(Size(96, 32))),
                      onPressed: () {},
                      child: const Text('Apply now'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
