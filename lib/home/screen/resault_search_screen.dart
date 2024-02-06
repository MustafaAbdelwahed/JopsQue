import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/home/show_modal_bottom_sheet.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/custom_chip.dart';
import 'package:graduated_project/widgets/search_bar_for_jops.dart';

class ResaultSearchScreen extends StatefulWidget {
  ResaultSearchScreen({super.key, required this.jopname});

  final String jopname;
  late final TextEditingController _searchController =
      TextEditingController(text: jopname);

  @override
  State<ResaultSearchScreen> createState() => _ResaultSearchScreenState();
}

class _ResaultSearchScreenState extends State<ResaultSearchScreen> {
  List<Widget> jops = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 5, right: 1),
            child: Consumer(builder: (context, ref, _) {
              return Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 5, right: 15),
                        child: Row(
                          children: [
                            IconButton(
                              alignment: Alignment.centerLeft,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: SearchBarForJops(
                              searchController: widget._searchController,
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return const ShowModalBottomSheet();
                                },
                              );
                            },
                            child: Image.asset(
                              "assets/image/icons/setting-4.png",
                              height: 25,
                              // alignment: Alignment.centerLeft,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomChipWithArrow(
                                    image: Image.asset(
                                      "assets/image/icons/arrow-down.png",
                                      height: 20,
                                    ),
                                    text: "Remote  ",
                                    chipColor: const Color(0xff091A7A),
                                    textColor: const Color(0xffFFFFFF),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  CustomChipWithArrow(
                                    image: Image.asset(
                                      "assets/image/icons/arrow-down.png",
                                      height: 20,
                                    ),
                                    text: "Full Time",
                                    chipColor: const Color(0xff091A7A),
                                    textColor: const Color(0xffFFFFFF),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  CustomChipWithArrow(
                                    image: Image.asset(
                                      height: 20,
                                      "assets/image/icons/arrow-down.png",
                                      color: const Color(0xff6B7280),
                                    ),
                                    text: "Post date",
                                    chipColor: const Color(0xffffffff),
                                    textColor: const Color(0xff6B7280),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  ref.watch(providerr).filterJops.isNotEmpty
                      ? Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              Container(
                                padding: const EdgeInsets.only(left: 30),
                                height: 36,
                                width: double.infinity,
                                alignment: Alignment.centerLeft,
                                color: const Color(0XFFE5E7EB),
                                child: Text(
                                  "Featuring ${ref.watch(providerr).filterJops.length} jobs",
                                  style:
                                      const TextStyle(color: Color(0XFF6B7280)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: ref.watch(providerr).filterJops,
                                ),
                              )
                            ])
                      : Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            Image.asset(
                                "assets/image/Ilustration/Search Ilustration.png"),
                            const SizedBox(
                              height: 24,
                            ),
                            const Text(
                              "Search not found",
                              // textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                  "Try searching with different keywords so we can show you",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff6B7280),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ],
                        )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
