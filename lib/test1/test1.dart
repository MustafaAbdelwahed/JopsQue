// import 'package:flutter/material.dart';
// import 'package:graduated_project/widgets/custom_chip.dart';
// import 'package:graduated_project/widgets/custom_elvated_button.dart';
// import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

// import '../widgets/custom_search_bar.dart';
// import '../widgets/custom_container.dart';

// class test1 extends StatelessWidget {
//   test1({super.key});

//   final TextEditingController _jobTittleContoller = TextEditingController();

//   final TextEditingController _locationContoller = TextEditingController();

//   final TextEditingController _salaryContoller = TextEditingController();
//   List<CustomContainer> jops = [];
//   List notFound = [
//     const SizedBox(
//       height: 24,
//     ),
//     Image.asset("assets/image/Ilustration/Search Ilustration.png"),
//     const SizedBox(
//       height: 24,
//     ),
//     const Text(
//       "Search not found",
//       // textAlign: TextAlign.end,
//       style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//     ),
//     const SizedBox(
//       height: 12,
//     ),
//     const Text("Try searching with different keywords so we can show you",
//         textAlign: TextAlign.center,
//         style: TextStyle(
//             color: Color(0xff6B7280),
//             fontSize: 16,
//             fontWeight: FontWeight.w400)),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding:  EdgeInsets.only(top: 20, left: 5, right: 1),
//             child: Column(children: <Widget>[
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       IconButton(
//                         alignment: Alignment.centerLeft,
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         icon: const Icon(Icons.arrow_back),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       const Expanded(
//                         child: CustomSearchBar(),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     children: [
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20)),
//                             isScrollControlled: true,
//                             context: context,
//                             builder: (BuildContext context) {
//                               return ShowModalBottomSheet(
//                                   jobTittleContoller: _jobTittleContoller,
//                                   locationContoller: _locationContoller,
//                                   salaryContoller: _salaryContoller);
//                             },
//                           );
//                         },
//                         child: Image.asset(
//                           "assets/image/icons/setting-4.png",
//                           // alignment: Alignment.centerLeft,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Row(
//                               children: [
//                                 CustomChip(text: "Remote"),
//                                 CustomChip(text: "Full Time"),
//                                 CustomChip(text: "Post date")
//                               ],
//                             )),
//                       )
//                     ],
//                   ),
//                   // const SizedBox(
//                   //   height: 20,
//                   // ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//             ]+ jops.isEmpty?[]:[]),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ShowModalBottomSheet extends StatefulWidget {
//   const ShowModalBottomSheet({
//     super.key,
//     required this.jobTittleContoller,
//     required this.locationContoller,
//     required this.salaryContoller,
//   });
//   final TextEditingController jobTittleContoller;
//   final TextEditingController locationContoller;
//   final TextEditingController salaryContoller;

//   @override
//   State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
// }

// class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
//   List<String> selectedChips = [];

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         alignment: Alignment.centerLeft,
//         padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
//         height: MediaQuery.of(context).copyWith().size.height * 0.95,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           // mainAxisSize: MainAxisSize.max,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Icon(Icons.arrow_back),
//                 ),
//                 const Text(
//                   "Set Filter",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedChips.clear();
//                     });
//                   },
//                   child: const Text(
//                     "Reset",
//                     style: TextStyle(color: Color(0xff3366FF)),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 28,
//             ),
//             const Text(
//               "Job Tittle",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             CustomeTextField(
//               cursorColor: const Color.fromARGB(121, 139, 136, 136),
//               borderRadius: 8,
//               borderColor: const Color(0xffD1D5DB),
//               textInputType: TextInputType.name,
//               controller: widget.jobTittleContoller,
//               prefixImage: Image.asset("assets/image/icons/briefcase.png"),
//               suffixIcons: Icons.abc_rounded,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             const Text(
//               "Location",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             CustomeTextField(
//               cursorColor: const Color.fromARGB(121, 139, 136, 136),
//               borderRadius: 8,
//               borderColor: const Color(0xffD1D5DB),
//               textInputType: TextInputType.name,
//               controller: widget.locationContoller,
//               prefixImage: Image.asset("assets/image/icons/location.png"),
//               suffixIcons: Icons.abc_rounded,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             const Text(
//               "Salary",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             CustomeTextField(
//               cursorColor: const Color.fromARGB(121, 139, 136, 136),
//               borderRadius: 8,
//               borderColor: const Color(0xffD1D5DB),
//               textInputType: TextInputType.name,
//               controller: widget.salaryContoller,
//               prefixImage: Image.asset("assets/image/icons/dollar-circle.png"),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             const Text(
//               "Job Type",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Wrap(
//               // crossAxisAlignment: WrapCrossAlignment.center,

//               spacing: 10,
//               runSpacing: 5,
//               children: [
//                 selectedChip(typeName: "Full Time"),
//                 selectedChip(typeName: "Remote"),
//                 selectedChip(typeName: "Contract"),
//                 selectedChip(typeName: "Part Time"),
//                 selectedChip(typeName: "Onsite"),
//                 selectedChip(typeName: "Internship"),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [],
//             ),
//             const Spacer(),
//             CustomElvatedButton(
//               onpress: () {},
//               color: const Color(0xff3366FF),
//               text: const Text("Show result"),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   FilterChip selectedChip({required String typeName}) {
//     return FilterChip(
//       padding: const EdgeInsets.only(top: 8, right: 14, bottom: 8, left: 10),
//       side: BorderSide(
//         width: 1,
//         color: selectedChips.contains(typeName)
//             ? const Color(0xff3366FF)
//             : const Color(0xff9CA3AF),
//       ),
//       backgroundColor: selectedChips.contains(typeName)
//           ? const Color(0xffD6E4FF)
//           : const Color(0xffFAFAFA),
//       pressElevation: 0,
//       label: Text(
//         typeName,
//         style: TextStyle(
//           color: selectedChips.contains(typeName)
//               ? const Color(0xff3366FF)
//               : const Color(0xff6B7280),
//           fontSize: 12,
//         ),
//       ),
//       // avatar: ,
//       onSelected: (bool selected) {
//         toggleChipSelection(
//             typeName, selected != selectedChips.contains(typeName));
//       },
//     );
//   }

//   void toggleChipSelection(String chip, bool selected) {
//     setState(() {
//       if (selected) {
//         selectedChips.add(chip);
//       } else {
//         selectedChips.remove(chip);
//       }
//       print(selectedChips);
//     });
//   }
// }

// class RecentSearches extends StatelessWidget {
//   const RecentSearches({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: SizedBox(
//         width: double.infinity,
//         height: 30,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Image.asset("assets/image/icons/clock.png"),
//             const Spacer(),
//             const Text(
//               "UI/UX Designer",
//             ),
//             const Spacer(
//               flex: 20,
//             ),
//             Image.asset("assets/image/icons/close-circle.png"),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PopularSearches extends StatelessWidget {
//   const PopularSearches({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: SizedBox(
//         width: double.infinity,
//         height: 30,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Image.asset("assets/image/icons/search-status.png"),
//             const Spacer(),
//             const Text("Junior UI Designer"),
//             const Spacer(
//               flex: 20,
//             ),
//             Image.asset("assets/image/icons/arrow-right.png"),
//           ],
//         ),
//       ),
//     );
//   }
// }
