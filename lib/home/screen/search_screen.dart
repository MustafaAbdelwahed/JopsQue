import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/home/screen/resault_search_screen.dart';
import 'package:graduated_project/home/widget/popular_searches.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/search_bar_for_jops.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 5, right: 15),
            child: Consumer(builder: (context, ref, _) {
              return Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: SearchBarForJops(
                        inSearchScreen: true,
                        searchController: _searchController,
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: ref.watch(providerr).recentSearches.isEmpty
                        ? []
                        : [
                            Container(
                              padding: const EdgeInsets.only(left: 30),
                              height: 36,
                              width: double.infinity,
                              alignment: Alignment.centerLeft,
                              color: const Color(0XFFE5E7EB),
                              child: const Text(
                                "Recent searches",
                                style: TextStyle(color: Color(0XFF6B7280)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Column(
                                  children:
                                      ref.watch(providerr).recentSearches),
                            ),
                          ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),

                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    height: 36,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    color: const Color(0XFFE5E7EB),
                    child: const Text(
                      "Popular searches",
                      style: TextStyle(color: Color(0XFF6B7280)),
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        PopularSearches(searchName: "Test Engineers"),
                        PopularSearches(searchName: "Flutter Developer"),
                        PopularSearches(
                            searchName: "Machine Learning Engineer"),
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
