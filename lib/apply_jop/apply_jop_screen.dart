import 'package:dotted_line/dotted_line.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/apply_jop/screen/biodata_screen.dart';
import 'package:graduated_project/apply_jop/screen/successfully_sent_data_screen.dart';
import 'package:graduated_project/apply_jop/screen/type_of_work._screen.dart';
import 'package:graduated_project/apply_jop/screen/upload_portfolio.dart';
import 'package:graduated_project/home/screen/home_screen.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';
import 'package:path/path.dart';

class ApplyJopScreen extends StatefulWidget {
  const ApplyJopScreen({super.key});

  @override
  State<ApplyJopScreen> createState() => _ApplyJopScreenState();
}

class _ApplyJopScreenState extends State<ApplyJopScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _biodataKey = GlobalKey<FormState>();

  int pageNumber = 0;
  bool issaved = false;
  bool isvisible = false;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: pageNumber != 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    isvisible = false;
                    pageNumber--;
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.linear);
                  });
                },
              )
            : null,
        title: const Text("Apply Job"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                issaved = !issaved;
              });
            },
            icon: Image.asset(
              'assets/image/icons/archive-minus.png',
              color: issaved ? Colors.blue : Colors.black,
              width: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      pageNumber > 0
                          ? Image.asset(
                              "assets/image/icons/tick-circle.png",
                              width: 44,
                              height: 44,
                            )
                          : Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xff3366FF)),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      color: Color(0xff3366FF),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Biodata",
                          style: TextStyle(
                              fontSize: 12, color: Color(0xff3366FF))),
                    ],
                  ),
                  SizedBox(
                    width: 60,
                    child: DottedLine(
                        lineLength: 30,
                        dashColor: pageNumber > 0
                            ? const Color(0xff3366FF)
                            : Colors.black),
                  ),
                  Column(
                    children: [
                      pageNumber > 1
                          ? Image.asset(
                              "assets/image/icons/tick-circle.png",
                              width: 44,
                              height: 44,
                            )
                          : Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: pageNumber >= 1
                                        ? const Color(0xff3366FF)
                                        : const Color(0xff9CA3AF)),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      color: pageNumber >= 1
                                          ? const Color(0xff3366FF)
                                          : const Color(
                                              0xff9CA3AF,
                                            ),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Type of work",
                          style: TextStyle(
                              fontSize: 12,
                              color: pageNumber >= 1
                                  ? const Color(0xff3366FF)
                                  : Colors.black)),
                    ],
                  ),
                  SizedBox(
                    width: 60,
                    child: DottedLine(
                        lineLength: 30,
                        dashColor: pageNumber > 1
                            ? const Color(0xff3366FF)
                            : Colors.black),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: pageNumber > 1
                                  ? const Color(0xff3366FF)
                                  : const Color(0xff9CA3AF)),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            "3",
                            style: TextStyle(
                                color: pageNumber > 1
                                    ? const Color(0xff3366FF)
                                    : const Color(0xff9CA3AF),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Type of work",
                          style: TextStyle(
                              fontSize: 12,
                              color: pageNumber > 1
                                  ? const Color(0xff3366FF)
                                  : Colors.black)),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      pageNumber = value;
                      // print(_pageController.page);
                    });
                  },
                  children: [
                    Form(
                      key: _biodataKey,
                      child: BiodataScreen(
                        nameController: nameController,
                        emailController: emailController,
                        phoneController: phoneController,
                      ),
                    ),
                    TypeOfWorkScreen(isvisible: isvisible),
                    const UploadPortfolioScreen()
                  ],
                ),
              ),
              Consumer(builder: (context, ref, _) {
                return CustomElvatedButton(
                    text: Text(
                      pageNumber == 1 ? "Next" : "Submit",
                      style: const TextStyle(fontSize: 16),
                    ),
                    onpress: () async {
                      switch (pageNumber) {
                        case 0:
                          if (_biodataKey.currentState!.validate()) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.linear);
                          } else {
                            return;
                          }
                        case 1:
                          if (ref.watch(providerr).whichTypeOfWork != null) {
                            ref.watch(providerr).setCVFile();
                            await Future.delayed(const Duration(seconds: 1));
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.linear);
                            break;
                          } else {
                            setState(() {
                              if (isvisible == false) {
                                isvisible = !isvisible;
                              }
                            });
                            break;
                          }
                        case 2:
                          if (ref.watch(providerr).pdfData != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const SuccessfullySentDataScreen(),
                            ));
                          } else {
                            break;
                          }
                      }
                    },
                    color: const Color(0xff3366FF));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
