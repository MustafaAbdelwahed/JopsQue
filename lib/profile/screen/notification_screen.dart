import 'package:flutter/material.dart';

class NotificationEditSCreen extends StatefulWidget {
  const NotificationEditSCreen({super.key});

  @override
  State<NotificationEditSCreen> createState() => _NotificationEditSCreenState();
}

class _NotificationEditSCreenState extends State<NotificationEditSCreen> {
  List<String> keyOfJob = [
    "Your Job Search Alert",
    "Job Application Update",
    "Job Application Reminders",
    "Jobs You May Be Interested In",
    "Job Seeker Updates",
  ];
  Map<dynamic, bool> jobNotification = {
    "Your Job Search Alert": true,
    "Job Application Update": true,
    "Job Application Reminders": false,
    "Jobs You May Be Interested In": true,
    "Job Seeker Updates": false,
  };
  List<String> keyOfOther = [
    "Show Profile",
    "All Message",
    "Message Nudges",
    // "",
    // "."
  ];
  Map<dynamic, bool> otherNotification = {
    "Show Profile": true,
    "All Message": true,
    "Message Nudges": true,
    // "": false,
    // ".": true,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            // horizontal: 20,
            ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                  color: const Color(0xffE5E7EB),
                  width: double.infinity,
                  height: 40,
                  child: const Text(
                    "Job notification",
                    style: TextStyle(fontSize: 16, color: Color(0xff6B7280)),
                    textAlign: TextAlign.left,
                  ),
                ),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SwitchListTile.adaptive(
                        title: Text(keyOfJob[index]),
                        value: jobNotification[keyOfJob[index]]!,
                        onChanged: (value) {
                          setState(() {
                            jobNotification[keyOfJob[index]] = value;
                            print(
                                "the ${keyOfJob[index]} is ${jobNotification[keyOfJob[index]]}");
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                          indent: 15,
                          endIndent: 20,
                          thickness: 1.5,
                        ),
                    itemCount: jobNotification.length),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                  color: const Color(0xffE5E7EB),
                  width: double.infinity,
                  height: 40,
                  child: const Text(
                    "Other notification",
                    style: TextStyle(fontSize: 16, color: Color(0xff6B7280)),
                    textAlign: TextAlign.left,
                  ),
                ),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SwitchListTile.adaptive(
                        title: Text(keyOfOther[index]),
                        value: otherNotification[keyOfOther[index]]!,
                        onChanged: (value) {
                          setState(() {
                            otherNotification[keyOfOther[index]] = value;
                            // print("the ${otherNotification[index]} is $value");
                            print(
                                "the ${keyOfOther[index]} is ${otherNotification[keyOfOther[index]]}");
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                          indent: 15,
                          endIndent: 20,
                          thickness: 1.5,
                        ),
                    itemCount: otherNotification.length),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
