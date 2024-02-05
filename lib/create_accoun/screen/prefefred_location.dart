import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:graduated_project/create_accoun/screen/creat_confirm_screen.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';

class PrefefredLocationScreeen extends StatefulWidget {
  const PrefefredLocationScreeen({super.key});

  @override
  State<PrefefredLocationScreeen> createState() =>
      _PrefefredLocationScreeenState();
}

class _PrefefredLocationScreeenState extends State<PrefefredLocationScreeen> {
  int currentText = 0;

  List<String> selectedChips = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Where are you prefefred Location?",
              // textAlign: TextAlign.end,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
                "Let us know, where is the work location you want at this time, so we can adjust it.",
                style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: 30),
            Center(
              child: CustomSlidingSegmentedControl<int>(
                children: {
                  0: Text(
                    "Work From Office",
                    style: TextStyle(
                        color: currentText == 0
                            ? Colors.white
                            : const Color.fromARGB(255, 93, 98, 110)),
                  ),
                  1: Text(
                    "Remote Work",
                    // "   Company   ",
                    style: TextStyle(
                        color: currentText == 1
                            ? Colors.white
                            : const Color(0XFF6B7280)),
                  ),
                },
                fixedWidth: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0XFFF4F4F5)),
                thumbDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0XFF091A7A)),
                // curve: Curves.bounceOut,
                duration: const Duration(milliseconds: 200),
                onValueChanged: (index) {
                  setState(() {
                    currentText = index;
                  });
                  // print(currentText);
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text("Select the country you want for your job",
                style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 5,
              runSpacing: 5,
              children: [
                customChip(
                    flag: Image.asset("assets/image/flags/United States.png"),
                    nameOfFlag: "United States"),
                customChip(
                    flag: Image.asset('assets/image/flags/Malaysia.png'),
                    nameOfFlag: "Malaysia"),
                customChip(
                    flag: Image.asset('assets/image/flags/Singapore.png'),
                    nameOfFlag: "Singapore"),
                customChip(
                    flag: Image.asset('assets/image/flags/Indonesia.png'),
                    nameOfFlag: "Indonesia"),
                customChip(
                    flag: Image.asset('assets/image/flags/Philiphines.png'),
                    nameOfFlag: "Philiphines"),
                customChip(
                    flag: Image.asset('assets/image/flags/Polandia.png'),
                    nameOfFlag: "Polandia"),
                customChip(
                    flag: Image.asset('assets/image/flags/India.png'),
                    nameOfFlag: "India"),
                customChip(
                    flag: Image.asset('assets/image/flags/Vietnam.png'),
                    nameOfFlag: "Vietnam"),
                customChip(
                    flag: Image.asset('assets/image/flags/China.png'),
                    nameOfFlag: "China"),
                customChip(
                    flag: Image.asset('assets/image/flags/Canada.png'),
                    nameOfFlag: "Canada"),
                customChip(
                    flag: Image.asset('assets/image/flags/Saudi Arabia.png'),
                    nameOfFlag: "Saudi Arabia"),
                customChip(
                    flag: Image.asset('assets/image/flags/Argentina.png'),
                    nameOfFlag: "Argentina"),
                customChip(
                    flag: Image.asset('assets/image/flags/Brazil.png'),
                    nameOfFlag: "Brazil"),
              ],
            ),
            // SizedBox(
            //   height: 40,
            // ),
            const Spacer(),
            CustomElvatedButton(
              text: const Text("Next"),
              onpress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CreatConfirmScreen(),
                ));
              },
              color: const Color(0xff3366FF),
            ),
          ],
        ),
      ),
    );
  }

  FilterChip customChip({Image? flag, required String nameOfFlag}) {
    return FilterChip(
      padding: const EdgeInsets.only(top: 8, right: 14, bottom: 8, left: 10),
      side: BorderSide(
        width: 1,
        color: selectedChips.contains(nameOfFlag)
            ? const Color(0xff3366FF)
            : const Color(0xffE5E7EB),
      ),
      backgroundColor: selectedChips.contains(nameOfFlag)
          ? const Color(0xffD6E4FF)
          : const Color(0xffFAFAFA),
      pressElevation: 0,
      label: Text(
        nameOfFlag,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
      ),
      // avatar: ,
      avatar: flag,
      onSelected: (bool selected) {
        toggleChipSelection(
            nameOfFlag, selected != selectedChips.contains(nameOfFlag));
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
