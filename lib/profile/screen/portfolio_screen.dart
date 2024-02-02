import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:path/path.dart';

import 'package:dotted_border/dotted_border.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});
  // int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Consumer(builder: (context, ref, _) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                const Text(
                  "Add portfolio here",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: ref.watch(providerr).setPortfolio,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    dashPattern: const [5, 5],
                    color: const Color.fromARGB(255, 20, 76, 230),
                    strokeWidth: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffecf2ff)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            "assets/image/icons/document-upload.png",
                            height: 60,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Upload your other file",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Max. file size 10 MB",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff6B7280),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            height: 40,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xffD6E4FF),
                              border:
                                  Border.all(color: const Color(0xff3366FF)),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: ,
                              children: [
                                Image.asset(
                                  "assets/image/icons/export.png",
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Add file",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3366FF)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // ref.watch(providerr).portfolioList.isEmpty ?       ListView.separated(
                //           separatorBuilder: (context, index) => const SizedBox(
                //             height: 20,
                //           ),
                //           shrinkWrap: true,
                //           itemCount: ref.watch(providerr).portfolioList.length - 1,
                //           itemBuilder: (context, index) {
                //             return ref.watch(providerr).portfolioList[index];
                //           },
                //         ):null
                Column(
                  children: ref.watch(providerr).portfolioList.toList(),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  // sizeOfTheFile(int size) {
  //   final kb = size / 1024;
  //   final mb = kb / 1024;
  //   return mb > 1 ? mb.toStringAsFixed(2) : kb.toStringAsFixed(2);
  // }
}

class PortfolioItem extends StatelessWidget {
  const PortfolioItem({super.key, required this.dataOfPdf});
  // int? selectedValue;
  final PlatformFile? dataOfPdf;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffD1D5DB))),
              leading: Image.asset(
                "assets/image/logo/pdf.png",
                height: 40,
              ),
              title: Text(
                dataOfPdf?.name != null
                    ? basenameWithoutExtension(dataOfPdf!.name)
                    : "  ",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(dataOfPdf?.name != null
                  ? "CV.pdf ${sizeOfTheFile(dataOfPdf!.size)} KB"
                  : "    "),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.watch(providerr).setCVFile();
                    },
                    child: Image.asset(
                      "assets/image/logo/edit-2.png",
                      height: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(providerr).removePortfolio(dataOfPdf!.name);
                    },
                    child: Image.asset(
                      "assets/image/icons/close-circle.png",
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }

  sizeOfTheFile(int size) {
    final kb = size / 1024;
    final mb = kb / 1024;
    return mb > 1 ? mb.toStringAsFixed(2) : kb.toStringAsFixed(2);
  }
}
