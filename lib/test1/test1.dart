import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduated_project/provider/provider.dart';
import 'package:path/path.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TextField with PopupMenuButton'),
        ),
        body: Center(
          child: TextFieldWithPopupMenu(),
        ),
      ),
    );
  }
}

class TextFieldWithPopupMenu extends StatelessWidget {
  TextFieldWithPopupMenu({super.key});

  String selectedOption = 'Option 1';
  void pickFile() async {
    String? filePath = await FilePicker.platform
        .pickFiles()
        .then((result) => result?.files.single.path);

    if (filePath != null) {
      String fileNameWithoutExtension = basenameWithoutExtension(filePath);
      print('Selected file without extension: $fileNameWithoutExtension');
    }
  }

  String? blsdasl;

  // // Default value
  void ApplyJobUploadPortfolio(PlatformFile bla) async {}

  void getFile() async {
    var filePath = await FilePicker.platform
        .pickFiles()
        .then((result) => result?.files.single);
    if (filePath != null) {
      PlatformFile blabla = filePath;
      print(filePath.runtimeType);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer(builder: (context, ref, _) {
        final prov = ref.watch(providerr);
        return ElevatedButton(
            onPressed: () {},
            child: Text(
              prov.pdfData?.name != null
                  ? basenameWithoutExtension(prov.pdfData!.name)
                  : "null",
            ));
      }),
    );
  }
}
