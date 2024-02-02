import 'dart:io';

// import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
// import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  String searchJop = stdin.readLineSync()!;
  SharedPreferences pref = await SharedPreferences.getInstance();

  List search = [searchJop];
  print(search);
  if (pref.getStringList("SearchJop") != null ||
      pref.getStringList("SearchJop")!.isNotEmpty) {
    search.addAll(pref.getStringList("SearchJop")!);
  }
  print(search);

  // pref.setStringList("SearchJop", [user.id.toString(), searchJop]);
}


// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var appBar = AppBar(
//     title: const Text("App"),
//   );
//   int pageNumber = 0;

//   final PageController _pageController = PageController();
//   @override
//   Widget build(BuildContext context) {
//     var pageSize = MediaQuery.of(context).size.height;
//     var notifySize = MediaQuery.of(context).padding.top;
//     var appBarSize = appBar.preferredSize.height;
//     double height = MediaQuery.of(context).size.height - appBarSize;
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('AppBar'),
//         ),
//         body: LayoutBuilder(builder: (context, constraints) {
//           return Column(
//             children: [
//               CustomSlidingSegmentedControl<int>(
//                 children: {
//                   0: Text(
//                     "Active",
//                     style: TextStyle(
//                         color: pageNumber == 0
//                             ? Colors.white
//                             : const Color.fromARGB(255, 93, 98, 110)),
//                   ),
//                   1: Text(
//                     "Rejected",
//                     // "   Company   ",
//                     style: TextStyle(
//                         color: pageNumber == 1
//                             ? Colors.white
//                             : const Color(0XFF6B7280)),
//                   ),
//                 },

//                 fixedWidth: 107,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: const Color(0XFFF4F4F5)),
//                 thumbDecoration: BoxDecoration(
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black,
//                         blurRadius: 1,
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(20),
//                     color: const Color(0XFF091A7A)),
//                 // curve: Curves.bounceOut,
//                 duration: const Duration(milliseconds: 200),
//                 onValueChanged: (index) {
//                   setState(() {
//                     pageNumber = index;
//                     _pageController.animateToPage(index,
//                         duration: const Duration(milliseconds: 200),
//                         curve: Curves.linear);
//                     // _pageController.animateToPage(index,
//                     //     duration: const Duration(milliseconds: 200),
//                     //     curve: Curves.linear);
//                   });
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Expanded(
//                 child: PageView(
//                   // padEnds: false,

//                   physics: const NeverScrollableScrollPhysics(),
//                   onPageChanged: (value) {
//                     setState(() {
//                       pageNumber = value;
//                     });
//                   },
//                   controller: _pageController,
//                   children: [
//                     Text("TheFirst"),
//                     Text("TheSecound"),
//                     Text("TheSecound"),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         }));
//   }
// }
