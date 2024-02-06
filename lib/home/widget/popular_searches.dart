import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/home/screen/resault_search_screen.dart';
import 'package:graduated_project/provider/provider.dart';

class PopularSearches extends StatelessWidget {
  const PopularSearches({
    super.key,
    required this.searchName,
  });
  final String searchName;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return InkWell(
        onTap: () {
          ref.watch(providerr).searchJobs(searchName);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ResaultSearchScreen(jopname: searchName),
          ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SizedBox(
            width: double.infinity,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/image/icons/search-status.png"),
                const SizedBox(
                  width: 7,
                ),
                const Spacer(),
                Text(searchName),
                const Spacer(
                  flex: 20,
                ),
                Image.asset(
                  "assets/image/icons/arrow-right-circle.png",
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
