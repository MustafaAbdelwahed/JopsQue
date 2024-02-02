import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    this.image,
    this.withImage = false,
    required this.ontap,
  });
  final bool withImage;
  final String title;
  final String? image;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: ontap,
          leading: withImage
              ? CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xffD6E4FF),
                  child: Image.asset(
                    image!,
                    color: const Color(0xff3d6eff),
                    height: 25,
                  ))
              : null,
          title: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/image/icons/right.png",
                height: 20,
              ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
        ),
        const Divider(
          indent: 20,
          endIndent: 20,
          thickness: 1,
        ),
      ],
    );
  }
}
