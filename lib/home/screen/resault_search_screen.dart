import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/custom_chip.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';
import 'package:graduated_project/widgets/custom_search_bar.dart';
import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

class ResaultSearchScreen extends StatefulWidget {
  ResaultSearchScreen({super.key, required this.jopname});

  final String jopname;
  late final TextEditingController _searchController =
      TextEditingController(text: jopname);

  @override
  State<ResaultSearchScreen> createState() => _ResaultSearchScreenState();
}

class _ResaultSearchScreenState extends State<ResaultSearchScreen> {
  // final TextEditingController _jobTittleContoller = TextEditingController();
  // final TextEditingController _locationContoller = TextEditingController();
  // final TextEditingController _salaryContoller = TextEditingController();
  List<Widget> jops = [];
//TODO Visibility in resault if empty
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 5, right: 1),
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
                              child: CustomSearchBar(
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomChipWithArrow(
                                  image: Image.asset(
                                      "assets/image/icons/arrow-down.png"),
                                  text: "Remote  ",
                                  chipColor: const Color(0xff091A7A),
                                  textColor: const Color(0xffFFFFFF),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                CustomChipWithArrow(
                                  image: Image.asset(
                                      "assets/image/icons/arrow-down.png"),
                                  text: "Full Time",
                                  chipColor: const Color(0xff091A7A),
                                  textColor: const Color(0xffFFFFFF),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                CustomChipWithArrow(
                                  image: Image.asset(
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
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: ref.watch(providerr).filterJops.isNotEmpty
                      ? [
                          Container(
                            padding: const EdgeInsets.only(left: 30),
                            height: 36,
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            color: const Color(0XFFE5E7EB),
                            child: Text(
                              "Featuring ${ref.watch(providerr).filterJops.length} jobs",
                              style: const TextStyle(color: Color(0XFF6B7280)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: ref.watch(providerr).filterJops,
                            ),
                          )
                        ]
                      : [
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
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class ShowModalBottomSheet extends StatefulWidget {
  const ShowModalBottomSheet({
    super.key,
  });

  @override
  State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
}

class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
  final TextEditingController jobTittleContoller = TextEditingController();
  final TextEditingController locationContoller = TextEditingController();
  final TextEditingController salaryContoller = TextEditingController();
  List<String> selectedChips = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer(builder: (context, ref, _) {
        final searchProv = ref.read(providerr);
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          height: MediaQuery.of(context).copyWith().size.height * 0.95,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    "Set Filter",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedChips.clear();
                      });
                    },
                    child: const Text(
                      "Reset",
                      style: TextStyle(color: Color(0xff3366FF)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                "Job Tittle",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(
                cursorColor: const Color.fromARGB(121, 139, 136, 136),
                borderRadius: 8,
                borderColor: const Color(0xffD1D5DB),
                controller: jobTittleContoller,
                prefixImage: Image.asset("assets/image/icons/briefcase.png"),
                suffixIcons: Icons.abc_rounded,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(
                cursorColor: const Color.fromARGB(121, 139, 136, 136),
                borderRadius: 8,
                borderColor: const Color(0xffD1D5DB),
                controller: locationContoller,
                prefixImage: Image.asset("assets/image/icons/location.png"),
                suffixIcons: Icons.abc_rounded,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Salary",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(
                cursorColor: const Color.fromARGB(121, 139, 136, 136),
                borderRadius: 8,
                borderColor: const Color(0xffD1D5DB),
                controller: salaryContoller,
                prefixImage:
                    Image.asset("assets/image/icons/dollar-circle.png"),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Job Type",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                // crossAxisAlignment: WrapCrossAlignment.center,

                spacing: 10,
                runSpacing: 5,
                children: [
                  selectedChip(typeName: "Full Time"),
                  selectedChip(typeName: "Remote"),
                  selectedChip(typeName: "Contract"),
                  selectedChip(typeName: "Part Time"),
                  selectedChip(typeName: "Onsite"),
                  selectedChip(typeName: "Internship"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [],
              ),
              const Spacer(),
              CustomElvatedButton(
                onpress: () {
                  (searchProv.getFilterdJobs(
                    name: jobTittleContoller.text,
                    location: locationContoller.text,
                    salary: salaryContoller.text,
                  ));
                  Navigator.of(context).pop();
                },
                color: const Color(0xff3366FF),
                text: const Text("Show result"),
              )
            ],
          ),
        );
      }),
    );
  }

  FilterChip selectedChip({required String typeName}) {
    return FilterChip(
      padding: const EdgeInsets.only(top: 8, right: 14, bottom: 8, left: 10),
      side: BorderSide(
        width: 1,
        color: selectedChips.contains(typeName)
            ? const Color(0xff3366FF)
            : const Color(0xff9CA3AF),
      ),
      backgroundColor: selectedChips.contains(typeName)
          ? const Color(0xffD6E4FF)
          : const Color(0xffFAFAFA),
      pressElevation: 0,
      label: Text(
        typeName,
        style: TextStyle(
          color: selectedChips.contains(typeName)
              ? const Color(0xff3366FF)
              : const Color(0xff6B7280),
          fontSize: 12,
        ),
      ),
      // avatar: ,
      onSelected: (bool selected) {
        toggleChipSelection(
            typeName, selected != selectedChips.contains(typeName));
      },
    );
  }

  void toggleChipSelection(String chip, bool selected) {
    setState(() {
      if (selected) {
        selectedChips.add(chip);
      } else {
        selectedChips.remove(chip);
      }
    });
  }
}
