// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/home/screen/resault_search_screen.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({
    super.key,
    required this.searchController,
    this.inSearchScreen = false,
    this.hinitText,
  });
  final TextEditingController searchController;
  final bool inSearchScreen;
  final String? hinitText;
  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.75,
        child: Consumer(builder: (context, ref, _) {
          return TextField(
            autofocus: widget.inSearchScreen ? true : false,

            controller: widget.searchController,
            onSubmitted: (value) async {
              if (value.isEmpty) {
                return;
              }
              setState(() {
                widget.searchController.text = value;
              });
              // ref.read(providerr).getSearchedJobs(widget.searchController.text);
              await Future.delayed(const Duration(milliseconds: 250));
              if (widget.inSearchScreen) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResaultSearchScreen(jopname: value),
                ));
              }
            },

            // selectionHeightStyle: BoxHeightStyle.tight,
            cursorColor: const Color.fromARGB(121, 139, 136, 136),
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Color(0xff9CA3AF)),
              hintText: widget.hinitText ?? "Search messages....",
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffD1D5DB)),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              prefixIconColor: Colors.black,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffD1D5DB)),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffD1D5DB)),
                  borderRadius: BorderRadius.circular(100)),
              // prefixIcon: const Icon(Icons.search_sharp)
              prefixIcon: Image.asset(
                "assets/image/icons/search-normal.png",
              ),
            ),
          );
        }));
  }
}
