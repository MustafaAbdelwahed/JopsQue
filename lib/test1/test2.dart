import 'package:flutter/material.dart';

import '../widgets/custom_elvated_button.dart';
import '../widgets/text_field/custom_textfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final TextEditingController jobTittleContoller = TextEditingController();
  final TextEditingController locationContoller = TextEditingController();
  final TextEditingController salaryContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowModalBottomSheet(
        jobTittleContoller: jobTittleContoller,
        locationContoller: locationContoller,
        salaryContoller: salaryContoller,
      ),
    );
  }
}

class ShowModalBottomSheet extends StatefulWidget {
  ShowModalBottomSheet({
    super.key,
    required this.jobTittleContoller,
    required this.locationContoller,
    required this.salaryContoller,
  });
  final TextEditingController jobTittleContoller;
  final TextEditingController locationContoller;
  final TextEditingController salaryContoller;

  @override
  State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
}

class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
  List<String> selectedChips = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        height: MediaQuery.of(context).copyWith().size.height * 0.90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                const Text("Set Filter"),
                const Text("Reset"),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            const Text("Job Tittle"),
            const SizedBox(
              height: 10,
            ),
            CustomeTextField(
              cursorColor: const Color.fromARGB(121, 139, 136, 136),
              borderRadius: 8,
              borderColor: const Color(0xffD1D5DB),
              textInputType: TextInputType.name,
              controller: widget.jobTittleContoller,
              prefixImage: Image.asset("assets/image/icons/briefcase.png"),
              suffixIcons: Icons.abc_rounded,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text("Location"),
            const SizedBox(
              height: 10,
            ),
            CustomeTextField(
              cursorColor: const Color.fromARGB(121, 139, 136, 136),
              borderRadius: 8,
              borderColor: const Color(0xffD1D5DB),
              textInputType: TextInputType.name,
              controller: widget.locationContoller,
              prefixImage: Image.asset("assets/image/icons/location.png"),
              suffixIcons: Icons.abc_rounded,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text("Salary"),
            const SizedBox(
              height: 10,
            ),
            CustomeTextField(
              cursorColor: const Color.fromARGB(121, 139, 136, 136),
              borderRadius: 8,
              borderColor: const Color(0xffD1D5DB),
              textInputType: TextInputType.name,
              controller: widget.salaryContoller,
              prefixImage: Image.asset("assets/image/icons/dollar-circle.png"),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text("Job Type"),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 5,
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
            const Spacer(),
            CustomElvatedButton(
              onpress: () {},
              color: const Color(0xff3366FF),
              text: const Text("Show result"),
            )
          ],
        ),
      ),
    );
  }

  FilterChip selectedChip({required String typeName}) {
    return FilterChip(
      padding: const EdgeInsets.only(top: 8, right: 14, bottom: 8, left: 10),
      side: BorderSide(
        width: 1,
        color: selectedChips.contains(typeName)
            ? const Color(0xff3366FF)
            : const Color(0xffE5E7EB),
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
      print(selectedChips);
    });
  }
}
