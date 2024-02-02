import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';
import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

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
          height: MediaQuery.of(context).copyWith().size.height * 0.9,
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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedChips.clear();
                          jobTittleContoller.clear();
                          locationContoller.clear();
                          salaryContoller.clear();
                        });
                      },
                      child: const Text(
                        "Reset",
                        style: TextStyle(color: Color(0xff3366FF)),
                      ),
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
                prefixImage: Image.asset(
                  "assets/image/icons/briefcase.png",
                  scale: 2.5,
                ),
                // suffixIcons: Icon(Icons.abc_rounded),
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
                prefixImage: Image.asset(
                  "assets/image/icons/location.png",
                  scale: 2.5,
                ),
                // suffixIcons: Icon(Icons.abc_rounded),
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
                prefixImage: Image.asset(
                  "assets/image/icons/dollar-circle.png",
                  scale: 2.5,
                ),
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
