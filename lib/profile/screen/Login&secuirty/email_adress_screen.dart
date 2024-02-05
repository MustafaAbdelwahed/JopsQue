import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';
import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

class EmailAdressScreen extends ConsumerWidget {
  EmailAdressScreen({
    super.key,
    // required this.email,
  });
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _emailController.text = ref.watch(providerr).user!.email!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email address"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Main e-mail address",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10,
            ),
            CustomeTextField(
                prefixImage: Image.asset(
                  "assets/image/icons/sms.png",
                  scale: 2.2,
                ),
                controller: _emailController),
            const Spacer(),
            CustomElvatedButton(
                onpress: () {
                  // myVariableProvider.dependencies;
                  ref.read(providerr).user!.email = _emailController.text;
                  ref.read(providerr).editUser();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("changed successfully")));
                  Navigator.of(context).pop();

                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const BootomNavigator(),
                  // ));
                },
                text: const Text("Save"))
          ],
        ),
      ),
    );
  }
}
