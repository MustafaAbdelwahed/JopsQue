import 'package:flutter/material.dart';
import 'package:graduated_project/model/jops.dart';

class JopDetailCompanyScreen extends StatelessWidget {
  const JopDetailCompanyScreen({super.key, required this.jops});
  final Jops jops;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Contact US",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xffD1D5DB),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Email",
                          style:
                              TextStyle(fontSize: 13, color: Color(0xff6B7280)),
                        ),
                        // SizedBox(
                        //   height: 2,
                        // ),
                        Text(
                          jops.compEmail,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xffD1D5DB),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Website",
                          style:
                              TextStyle(fontSize: 13, color: Color(0xff6B7280)),
                        ),
                        // SizedBox(
                        //   height: 2,
                        // ),
                        Text(
                          jops.compWebsite,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
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
