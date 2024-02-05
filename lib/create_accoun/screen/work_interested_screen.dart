import 'package:flutter/material.dart';
import 'package:graduated_project/create_accoun/screen/prefefred_location.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';

import '../widget/work_interested_irem.dart';

class WorkInterestedScreen extends StatelessWidget {
  const WorkInterestedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 30),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "What type of work are you interested in?",
                // textAlign: TextAlign.end,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                  "Tell us what you’re interested in so we can customise the app for your needs.",
                  style: TextStyle(
                      color: Color(0xff6B7280),
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 30),
              GridView(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (1 / 0.8), crossAxisCount: 2),
                children: const [
                  WorkInterestedItem(
                    interestedName: "UI/UX Designer",
                    interestedeIcon: "assets/image/icons/bezier.png",
                  ),
                  WorkInterestedItem(
                    interestedName: "Ilustrator Designer",
                    interestedeIcon: "assets/image/icons/pen-tool-2.png",
                  ),
                  WorkInterestedItem(
                    interestedName: "Developert",
                    interestedeIcon: "assets/image/icons/code.png",
                  ),
                  WorkInterestedItem(
                    interestedName: "Management",
                    interestedeIcon: "assets/image/icons/graph.png",
                  ),
                  WorkInterestedItem(
                    interestedName: "Information Technology",
                    interestedeIcon: "assets/image/icons/monitor-mobbile.png",
                  ),
                  WorkInterestedItem(
                    interestedName: "Research and Analytics",
                    interestedeIcon: "assets/image/icons/cloud-add.png",
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 60,
              // ),
              const Spacer(),
              CustomElvatedButton(
                text: const Text("Next"),
                onpress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PrefefredLocationScreeen(),
                  ));
                },
                color: const Color(0xff3366FF),
              )
            ],
          ),
        ),
      ),
    );
  }
}
