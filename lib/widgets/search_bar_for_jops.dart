// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/database/local_database.dart';
import 'package:graduated_project/home/screen/resault_search_screen.dart';
import 'package:graduated_project/provider/provider.dart';

class SearchBarForJops extends StatefulWidget {
  const SearchBarForJops({
    super.key,
    required this.searchController,
    this.inSearchScreen = false,
  });
  final TextEditingController searchController;
  final bool inSearchScreen;

  @override
  State<SearchBarForJops> createState() => _SearchBarForJopsState();
}

class _SearchBarForJopsState extends State<SearchBarForJops> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Consumer(builder: (context, ref, _) {
          return TextField(
            // textAlign: TextAlign.,
            autofocus: widget.inSearchScreen ? true : false,

            controller: widget.searchController,
            onSubmitted: (value) async {
              // LocalDataBase.getSearchJop(
              //   ref.watch(providerr).user!,
              ref.watch(providerr).setSearch(value.trim());
              // );
              if (value.isEmpty) {
                return;
              }
              setState(() {
                widget.searchController.text = value;
              });
              // ref.read(providerr).getSearchedJobs(widget.searchController.text);
              await Future.delayed(const Duration(milliseconds: 400));
              if (widget.inSearchScreen) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResaultSearchScreen(jopname: value),
                ));
              }
            },

            // selectionHeightStyle: BoxHeightStyle.tight,
            cursorColor: const Color.fromARGB(121, 139, 136, 136),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
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
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.searchController.clear();
                      });
                    },
                    icon: Image.asset(
                      "assets/image/icons/close-circle.png",
                      height: 25,
                      color: Colors.black,
                    ))),
          );
        }));
  }
}
