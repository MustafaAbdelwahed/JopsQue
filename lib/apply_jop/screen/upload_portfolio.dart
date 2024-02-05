import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:path/path.dart';

class UploadPortfolioScreen extends StatefulWidget {
  const UploadPortfolioScreen({
    super.key,
  });

  @override
  State<UploadPortfolioScreen> createState() => _UploadPortfolioScreenState();
}

class _UploadPortfolioScreenState extends State<UploadPortfolioScreen> {
  int? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Consumer(builder: (context, ref, _) {
        final prov = ref.watch(providerr);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Upload portfolio",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Fill in your bio data correctly",
              style: TextStyle(
                color: Color(0xff6B7280),
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  children: [
                    const TextSpan(text: "Upload CV "),
                    const TextSpan(
                        text: "*    ", style: TextStyle(color: Colors.red)),
                    TextSpan(
                        text: prov.pdfData == null ? "this Field Required" : "",
                        style: const TextStyle(color: Colors.red))
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffD1D5DB))),
              leading: Image.asset(
                "assets/image/logo/pdf.png",
                height: 40,
              ),
              title: Text(
                prov.pdfData?.name != null
                    ? basenameWithoutExtension(prov.pdfData!.name)
                    : "  ",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(prov.pdfData?.name != null
                  ? "CV.pdf ${sizeOfTheFile(prov.pdfData!.size)} KB"
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
                      ref.read(providerr).removeCVData();
                    },
                    child: Image.asset(
                      "assets/image/icons/close-circle.png",
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Other File",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              dashPattern: const [5, 5],
              color: const Color(0xff6690FF),
              strokeWidth: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffECF2FF)),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                        border: Border.all(color: const Color(0xff3366FF)),
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
            const SizedBox(
              height: 50,
            )
          ],
        );
      }),
    );
  }

  sizeOfTheFile(int size) {
    final kb = size / 1024;
    final mb = kb / 1024;
    return mb > 1 ? mb.toStringAsFixed(2) : kb.toStringAsFixed(2);
  }
}
