import 'package:flutter/material.dart';
import 'package:graduated_project/model/jops.dart';

class JopDetailDescreptionScreen extends StatelessWidget {
  const JopDetailDescreptionScreen({super.key, required this.jops});
  final Jops jops;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Job Description",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              jops.jobDescription,
              style: const TextStyle(fontSize: 13, color: Color(0xff4B5563)),
              strutStyle: const StrutStyle(height: 1.5),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "About Company",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              jops.aboutComp,
              strutStyle: const StrutStyle(height: 1.5),
              style: const TextStyle(fontSize: 13, color: Color(0xff4B5563)),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
