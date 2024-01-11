import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/home/screen/resault_search_screen.dart';
import 'package:graduated_project/provider/provider.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.searchController,
    this.inSearchScreen = false,
  });
  final TextEditingController searchController;
  final bool inSearchScreen;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
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
              ref.read(providerr).getSearchedJobs(widget.searchController.text);
              await Future.delayed(const Duration(milliseconds: 250));
              print(value);
              if (widget.inSearchScreen) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResaultSearchScreen(jopname: value),
                ));
              }
            },

            // selectionHeightStyle: BoxHeightStyle.tight,
            cursorColor: const Color.fromARGB(121, 139, 136, 136),
            decoration: InputDecoration(
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
                      color: Colors.black,
                    ))),
          );
        }));
  }
}
