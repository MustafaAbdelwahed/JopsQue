import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/provider/provider.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved"),
      ),
      body: Consumer(builder: (context, ref, _) {
        final prov = ref.watch(providerr);
        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prov.savedJops.isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Image.asset(
                            "assets/image/Ilustration/Saved Ilustration.png"),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          "Nothing has been saved yet",
                          textAlign: TextAlign.center,
                          // textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                            "  Press the star icon on the job you want to save.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff6B7280),
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        // const Spacer(
                        //   flex: 3,
                        // ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )
                  // const Spacer(),
                  : SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            height: 36,
                            width: double.infinity,
                            color: const Color(0xFFE0E0E2),
                            child: Center(
                              child: Text(
                                "${prov.savedJops.length} Job Saved",
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15, left: 15),
                            child: Column(
                              children: prov.savedJops,
                            ),
                          )
                        ],
                      ),
                    )
            ]

            // : prov.savedJops
            );
      }),
    );
  }
}
