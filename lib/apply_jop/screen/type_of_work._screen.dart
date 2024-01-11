import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/provider/provider.dart';

class TypeOfWorkScreen extends StatefulWidget {
  const TypeOfWorkScreen({
    super.key,
    required this.isvisible,
  });
  final bool isvisible;

  @override
  State<TypeOfWorkScreen> createState() => _TypeOfWorkScreenState();
}

class _TypeOfWorkScreenState extends State<TypeOfWorkScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Consumer(builder: (context, ref, _) {
        final selectedvalue = ref.watch(providerr).whichTypeOfWork;
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Type of work",
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
              height: 15,
            ),
            Visibility(
              visible: widget.isvisible,
              child: const SizedBox(
                height: 15,
                child: Text(
                  "choose one of them ",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Visibility(
              visible: !widget.isvisible,
              child: const SizedBox(
                height: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: RadioListTile(
                tileColor: selectedvalue != 1 ? null : const Color(0xffD6E4FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                        color: selectedvalue != 1
                            ? const Color(0xffD1D5DB)
                            : const Color(0xff3366FF))),

                value: 1,
                groupValue: selectedvalue,
                onChanged: (value) {
                  setState(() {
                    ref.read(providerr).whichTypeOfWork = value;
                  });
                },
                controlAffinity: ListTileControlAffinity
                    .trailing, // Align radio to the right
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Senior UX Designer',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                subtitle: const Text("CV.pdf . Portfolio.pdf"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: RadioListTile(
                tileColor: selectedvalue != 2 ? null : const Color(0xffD6E4FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                        color: selectedvalue != 2
                            ? const Color(0xffD1D5DB)
                            : const Color(0xff3366FF))),

                value: 2,
                groupValue: selectedvalue,
                onChanged: (value) {
                  setState(() {
                    ref.read(providerr).whichTypeOfWork = value;
                  });
                },
                controlAffinity: ListTileControlAffinity
                    .trailing, // Align radio to the right
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Senior UI Designer',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                subtitle: const Text("CV.pdf . Portfolio.pdf"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: RadioListTile(
                tileColor: selectedvalue != 3 ? null : const Color(0xffD6E4FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                        color: selectedvalue != 3
                            ? const Color(0xffD1D5DB)
                            : const Color(0xff3366FF))),

                value: 3,
                groupValue: selectedvalue,
                onChanged: (value) {
                  setState(() {
                    ref.read(providerr).whichTypeOfWork = value;
                  });
                },
                controlAffinity: ListTileControlAffinity
                    .trailing, // Align radio to the right
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Graphik Designer',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                subtitle: const Text("CV.pdf . Portfolio.pdf"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: RadioListTile(
                tileColor: selectedvalue != 4 ? null : const Color(0xffD6E4FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                        color: selectedvalue != 4
                            ? const Color(0xffD1D5DB)
                            : const Color(0xff3366FF))),
                value: 4,
                groupValue: selectedvalue,
                onChanged: (value) {
                  setState(() {
                    ref.read(providerr).whichTypeOfWork = value;
                  });
                },
                controlAffinity: ListTileControlAffinity
                    .trailing, // Align radio to the right
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Front-End Developer',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                subtitle: const Text("CV.pdf . Portfolio.pdf"),
              ),
            ),
          ],
        );
      }),
    );
  }
}
