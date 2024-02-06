import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/apply_jop/screen/biodata_screen.dart';
import 'package:graduated_project/apply_jop/screen/successfully_sent_data_screen.dart';
import 'package:graduated_project/apply_jop/screen/type_of_work._screen.dart';
import 'package:graduated_project/apply_jop/screen/upload_portfolio.dart';
import 'package:graduated_project/model/jops.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';
import 'package:graduated_project/widgets/saved_icon.dart';

class ApplyJopScreen extends StatefulWidget {
  const ApplyJopScreen({super.key, required this.jop});
  final Jops jop;
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
          SizedBox(width: 30, child: SavedIcon(jops: widget.jop)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Expanded(
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
                                      border: Border.all(
                                          color: const Color(0xff3366FF)),
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
                            Text("Upload portfolio",
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
                          TypeOfWorkScreen(
                              isvisible: isvisible, jop: widget.jop),
                          const UploadPortfolioScreen()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Consumer(builder: (context, ref, _) {
              return CustomElvatedButton(
                  text: Text(
                    pageNumber < 2 ? "Next" : "Submit",
                    style: const TextStyle(fontSize: 16),
                  ),
                  onpress: () async {
                    switch (pageNumber) {
                      case 0:
                        if (_biodataKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.linear);
                        } else {
                          return;
                        }
                      case 1:
                        if (ref.watch(providerr).typeOfWork != null) {
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
                          ref.watch(providerr).sentDataToapplyJop(
                              nameController.text,
                              emailController.text,
                              phoneController.text,
                              widget.jop.jobTimeType,
                              widget.jop.id);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const SuccessfullySentDataScreen(
                                    // user: user,
                                    ),
                          ));
                        }
                    }
                  },
                  color: const Color(0xff3366FF));
            }),
          ],
        ),
      ),
    );
  }

  // Future<Void?> sentDataToapplyJop(WidgetRef ref) async {
  //   Dio dio = Dio();
  //   int id = await LocalDataBase.getID();
  //   String token = await LocalDataBase.getToken();
  //   final response = await dio.post(
  //     'https://project2.amit-learning.com/api/apply',
  //     data: {
  //       // 'cv_file': null,
  //       'name': nameController.text,
  //       'email': emailController.text,
  //       'mobile': phoneController.text,
  //       'work_type': widget.jop.jobTimeType,
  //       // 'other_file': null,

  //       'jobs_id': widget.jop.id,
  //       'user_id': id
  //     },
  //     options: Options(headers: {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json',
  //       "Accept": "application/json",
  //     }, validateStatus: (_) => true),
  //   );
  //   print(response);

  //   return null;
  // }
}
