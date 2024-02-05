import 'package:flutter/material.dart';
import 'package:graduated_project/applyid_jop/applyid_jop_screen.dart';
import 'package:graduated_project/home/screen/home_screen.dart';
import 'package:graduated_project/message/screen/home_messsage.dart';
import 'package:graduated_project/profile/screen/profile_screen.dart';
import 'package:graduated_project/saved_jops/saved_screen.dart';

class BootomNavigator extends StatefulWidget {
  BootomNavigator({super.key, this.selectedIndex = 0});
  int selectedIndex;
  @override
  State<BootomNavigator> createState() => _BootomNavigatorState();
}

// int currentSelectedScreenIndex = 0;
List body = <Widget>[
  const HomeScreen(),
  HomeMessageScreen(),
  const ApplyidJopScreen(),
  const SavedScreen(),
  const ProfileScreen(),
];

class _BootomNavigatorState extends State<BootomNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[widget.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff3366ff),
        selectedFontSize: 12,
        unselectedFontSize: 12,

        // unselectedFontSize: 5,
        onTap: (index) {
          setState(() {
            widget.selectedIndex = index;
          });
        },
        currentIndex: widget.selectedIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white54,
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Image.asset(
                  widget.selectedIndex == 0
                      ? "assets/image/icons/home_bold.png"
                      : "assets/image/icons/home.png",
                  height: 30,
                  color: widget.selectedIndex == 0
                      ? const Color(0xff3366ff)
                      : const Color(0xffa2a9b4),
                ),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Image.asset(
                  widget.selectedIndex == 1
                      ? "assets/image/icons/message_bold.png"
                      : "assets/image/icons/message.png",
                  height: 30,
                  color: widget.selectedIndex == 1
                      ? const Color(0xff3366ff)
                      : const Color(0xffa2a9b4),
                ),
              ),
              label: "Messages"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Image.asset(
                  widget.selectedIndex == 2
                      ? "assets/image/icons/briefcase_bold.png"
                      : "assets/image/icons/briefcase.png",
                  height: 30,
                  color: widget.selectedIndex == 2
                      ? const Color(0xff3366ff)
                      : const Color(0xffa2a9b4),
                ),
              ),
              label: "Applied"),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Image.asset(
                widget.selectedIndex == 3
                    ? "assets/image/icons/archive-minus_bold.png"
                    : "assets/image/icons/archive-minus.png",
                height: 30,
                color: widget.selectedIndex == 3
                    ? const Color(0xff3366ff)
                    : const Color(0xffa2a9b4),
              ),
            ),
            backgroundColor: Colors.black,
            label: "Saved,",
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Image.asset(
                  widget.selectedIndex == 4
                      ? "assets/image/icons/profile_bold.png"
                      : "assets/image/icons/profile.png",
                  height: 30,
                  color: widget.selectedIndex == 4
                      ? const Color(0xff3366ff)
                      : const Color(0xffa2a9b4),
                ),
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
