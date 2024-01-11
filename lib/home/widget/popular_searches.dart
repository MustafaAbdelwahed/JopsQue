import 'package:flutter/material.dart';

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
