import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

String selectLang = "English";

List<String> flages = [
  "assets/image/square flags/England.png",
  "assets/image/square flags/Indonesia.png",
  "assets/image/square flags/Saudi Arabia.png",
  "assets/image/square flags/China.png",
  "assets/image/square flags/Netherlands.png",
  "assets/image/square flags/France.png",
  "assets/image/square flags/Germany.png",
  "assets/image/square flags/Japan.png",
  "assets/image/square flags/South Korea.png",
  "assets/image/square flags/Portugal.png",
];
List<String> nameOfLang = [
  'English',
  'Indonesia',
  'Arabic',
  'Chinese',
  'Dutch',
  'French',
  'German',
  'Japanese',
  'Korean',
  'Portuguese',
];

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Row(
                children: [
                  Image.asset(
                    flages[index],
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(nameOfLang[index]),
                ],
              ),
              value: nameOfLang[index],
              groupValue: selectLang,
              onChanged: (value) {
                setState(() {
                  selectLang = value!;
                });
              },
            );
          },
          separatorBuilder: (context, index) => const Divider(
                indent: 15,
                endIndent: 20,
                thickness: 1.5,
              ),
          itemCount: flages.length),
    );
  }
}
