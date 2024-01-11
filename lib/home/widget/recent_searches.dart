import 'package:flutter/material.dart';

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
            Image.asset("assets/image/icons/close-circle.png"),
          ],
        ),
      ),
    );
  }
}
