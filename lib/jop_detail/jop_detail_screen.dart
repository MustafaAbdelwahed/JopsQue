import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:graduated_project/apply_jop/apply_jop_screen.dart';
import 'package:graduated_project/jop_detail/screen/company_screen.dart';
import 'package:graduated_project/jop_detail/screen/people_screen.dart';
import 'package:graduated_project/model/jops.dart';
import 'package:graduated_project/widgets/custom_chip.dart';
import 'package:graduated_project/message/widget/saved_icon.dart';

import '../widgets/custom_elvated_button.dart';
import 'screen/descreption_screen.dart';

class JopDetailScreen extends StatefulWidget {
  const JopDetailScreen({super.key, required this.jop});
  final Jops jop;

  @override
  State<JopDetailScreen> createState() => _JopDetailScreenState();
}

class _JopDetailScreenState extends State<JopDetailScreen> {
  int currentText = 0;
  int pageNumber = 0;
  final PageController _pageController = PageController();
  late List listLocation = widget.jop.location.split(" ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Detail"),
        actions: [
          SizedBox(width: 30, child: SavedIcon(jops: widget.jop)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.network(
            widget.jop.image,
            height: 60,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.jop.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "${widget.jop.compName} • ${listLocation[listLocation.length - 2]} ${listLocation.last} ",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomChip(
                text: widget.jop.jobTimeType,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomChip(
                text: widget.jop.jobType,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          CustomSlidingSegmentedControl<int>(
            children: {
              0: Text(
                "Desicription",
                style: TextStyle(
                    color: pageNumber == 0
                        ? Colors.white
                        : const Color.fromARGB(255, 93, 98, 110)),
              ),
              1: Text(
                "Company",
                // "   Company   ",
                style: TextStyle(
                    color: pageNumber == 1
                        ? Colors.white
                        : const Color(0XFF6B7280)),
              ),
              2: Text(
                "People",
                // "   Company   ",
                style: TextStyle(
                    color: pageNumber == 2
                        ? Colors.white
                        : const Color(0XFF6B7280)),
              ),
            },

            fixedWidth: 107,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0XFFF4F4F5)),
            thumbDecoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: const Color(0XFF091A7A)),
            // curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 200),
            onValueChanged: (index) {
              setState(() {
                pageNumber = index;

                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView(
              // padEnds: false,

              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  pageNumber = value;
                });
              },
              controller: _pageController,
              children: [
                JopDetailDescreptionScreen(jops: widget.jop),
                JopDetailCompanyScreen(jops: widget.jop),
                JopDetailPeopleScreen(jops: widget.jop)
              ],
            ),
          ),
          CustomElvatedButton(
              text: const Text("Apply now"),
              onpress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ApplyJopScreen(
                    jop: widget.jop,
                  ),
                ));
              },
              color: const Color(0xff3366FF)),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
