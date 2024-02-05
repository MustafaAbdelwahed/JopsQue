import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:graduated_project/widgets/custom_elvated_button.dart';
import 'package:graduated_project/widgets/text_field/custom_textfield.dart';

import '../../widgets/dialing_code.dart';

class EditProfileScreen extends ConsumerWidget {
  EditProfileScreen({
    super.key,
  });

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool first = true;
  AppBar appBar = AppBar(
    title: const Text('Edit Profile'),
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pageSize = MediaQuery.of(context).size.height;
    var notifySize = MediaQuery.of(context).padding.top;
    var appBarSize = appBar.preferredSize.height;
    if (first) {
      final prov = ref.read(providerr);
      _nameController.text = ref.watch(providerr).user!.name!;
      _bioController.text = prov.user!.bio ?? "";
      _adressController.text = prov.user!.address ?? "";
      _phoneController.text = prov.user!.phone ?? "";
      first = false;
    }
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          height: pageSize - (appBarSize + notifySize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  child: ClipOval(
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.7,
                          child: Image.asset(
                            "assets/image/profile/Profile.png",
                            scale: 0.5,
                            fit: BoxFit.cover,
                            height: 150,
                            width: 100,
                          ),
                        ),
                        Center(
                          child: Image.asset(
                            "assets/image/icons/camera.png",
                            fit: BoxFit.cover,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: const Text(
                  "Change  Photo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff3366FF)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Name",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff9CA3AF))),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(controller: _nameController),
              const SizedBox(
                height: 20,
              ),
              const Text("Bio",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff9CA3AF))),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(controller: _bioController),
              const SizedBox(
                height: 20,
              ),
              const Text("Address",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff9CA3AF))),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(controller: _adressController),
              const SizedBox(
                height: 20,
              ),
              const Text("No.Handphone",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff9CA3AF))),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(
                cursorColor: const Color.fromARGB(255, 216, 114, 114),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This Field is Require';
                  } else if (value.length < 9) {
                    return 'Enter The correct number ';
                  } else {
                    return null;
                  }
                },
                controller: _phoneController,
                prefixIcons: const DialingCode(),
              ),
              Expanded(
                child: const SizedBox(
                    // height: 173,
                    ),
              ),
              CustomElvatedButton(
                  text: const Text("Save",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  onpress: () {
                    ref.read(providerr).user!.name = _nameController.text;

                    ref.read(providerr).user!.bio = _bioController.text;

                    ref.read(providerr).user!.address = _adressController.text;

                    ref.read(providerr).user!.phone = _phoneController.text;

                    print(ref.read(providerr).user!.bio!.isEmpty);
                    ref.read(providerr).editUser();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("changed successfully")));
                    Navigator.of(context).pop();
                  },
                  color: const Color(0xff3366FF)),
            ],
          ),
        ),
      ),
    );
  }
}
