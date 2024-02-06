import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/model/company.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

import '../widget/company_message.dart';
import '../widget/user_message.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({
    super.key,
    required this.company,
  });
  final Company company;
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.amber,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              maxRadius: 20,
              backgroundImage: AssetImage(company.image!),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(company.name!),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                bootomSheet(context);
              },
              child: Image.asset(
                "assets/image/icons/more.png",
                width: 25,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        // padding: const EdgeInsets.only(top: 39, right: 15, left: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                      child: Row(
                        // mainAxisSize: MainAxisSize.max,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            // width: MediaQuery.of(context).size.width * 0.3,
                            child: Divider(
                              // indent: 20,
                              endIndent: 20,
                              thickness: 2,
                            ),
                          ),
                          Text(
                            "Today,  Nov 13",
                            style: TextStyle(color: Color(0xff9CA3AF)),
                          ),
                          Expanded(
                            // width: MediaQuery.of(context).size.width * 0.3,
                            child: Divider(
                              indent: 20,
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CompanyMessage(
                      text:
                          "Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.",
                    ),
                    UserMessage(
                      text:
                          "Hi Melan, thank you for considering me, this is good news for me.",
                    ),
                    CompanyMessage(
                        text:
                            "Can we have an interview via google meet call today at 3pm?"),
                    UserMessage(text: "Of course, I can!"),
                    CompanyMessage(
                        text:
                            "Ok, here I put the google meet link for later this afternoon. I ask for the timeliness, thank you!"),
                    // const Spacer(),
                    // SizedBox(
                    //   height: 70,
                    // ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      "assets/image/icons/paperclip.png",
                      width: 44,
                    ),
                  ),
                  SizedBox(
                      width: 230,
                      // height: 55,
                      child: CustomTextMessage(
                          messageController: _messageController)),
                  GestureDetector(
                    child: Image.asset(
                      "assets/image/icons/Microphone.png",
                      width: 44,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void bootomSheet(BuildContext context) {
    showModalBottomSheet(
      // useSafeArea: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Container(
          padding:
              const EdgeInsets.only(top: 25, right: 20, left: 20, bottom: 20),
          // height: MediaQuery.of(context).size.height * 0.5,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const BottomSheetItem(
                      image: "assets/image/icons/briefcase.png",
                      title: "Visit job post",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const BottomSheetItem(
                      image: "assets/image/icons/note.png",
                      title: "View my application",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const BottomSheetItem(
                      image: "assets/image/icons/sms.png",
                      title: "Mark as unread",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const BottomSheetItem(
                      image: "assets/image/icons/notification.png",
                      title: "Mute",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const BottomSheetItem(
                      image: "assets/image/icons/import.png",
                      title: "Archive",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const BottomSheetItem(
                      image: "assets/image/icons/trash.png",
                      title: "Delete conversation",
                    ),
                  ),
                ]),
          ),
        );
      },
    );
  }
}

class CustomTextMessage extends StatelessWidget {
  const CustomTextMessage({
    super.key,
    required TextEditingController messageController,
  }) : _messageController = messageController;

  final TextEditingController _messageController;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Consumer(
          builder: (context,ref,_) {
            return TextFormField(
              onFieldSubmitted: (value) {
                // ref.read(providerr).
                print(value);
                
              },
              // maxLines: 200,
              controller: _messageController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  focusColor: Colors.amber,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffD1D5DB)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffD1D5DB)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  hintText: "Write a message..."),
            );
          }
        );
      }
    );
  }
}

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color(0xffD1D5DB),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              image,
              color: Colors.black.withOpacity(0.8),
              height: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Image.asset(
              "assets/image/icons/arrow-right.png",
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
