import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:graduated_project/home/resault_search_screen.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
          onSubmitted: (value) {
            if (value.isEmpty) {
              return;
            }
            print(value);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ResaultSearchScreen(jopname: value),
            ));
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
          )),
    );
  }
}
