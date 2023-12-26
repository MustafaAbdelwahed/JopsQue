import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FilterChip Example'),
        ),
        body: ChipExample(),
      ),
    );
  }
}

class ChipExample extends StatefulWidget {
  @override
  _ChipExampleState createState() => _ChipExampleState();
}

class _ChipExampleState extends State<ChipExample> {
  List<String> selectedChips = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Selected Chips: ${selectedChips.join(", ")}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  FilterChip designcustom({required Image flag, required String nameOfFlag}) {
    return FilterChip(
      padding: EdgeInsets.only(top: 8, right: 14, bottom: 8, left: 10),
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
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
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
