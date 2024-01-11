import 'package:flutter/material.dart';
import 'package:graduated_project/widgets/custom_search_bar.dart';

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
            child: Column(
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
                        child: CustomSearchBar(
                      inSearchScreen: true,
                      searchController: _searchController,
                    ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
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
                // SizedBox(
                //   height: 20,
                // ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      RecentSearches(),
                      RecentSearches(),
                      RecentSearches(),
                      RecentSearches(),
                      RecentSearches(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      PopularSearches(),
                      PopularSearches(),
                      PopularSearches(),
                      PopularSearches(),
                      PopularSearches(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecentSearches extends StatelessWidget {
  const RecentSearches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: double.infinity,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/image/icons/clock.png"),
            const Spacer(),
            const Text(
              "UI/UX Designer",
            ),
            const Spacer(
              flex: 20,
            ),
            Image.asset(
              "assets/image/icons/close-circle.png",
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class PopularSearches extends StatelessWidget {
  const PopularSearches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: double.infinity,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/image/icons/search-status.png"),
            const Spacer(),
            const Text("Junior UI Designer"),
            const Spacer(
              flex: 20,
            ),
            Image.asset("assets/image/icons/arrow-right.png"),
          ],
        ),
      ),
    );
  }
}
