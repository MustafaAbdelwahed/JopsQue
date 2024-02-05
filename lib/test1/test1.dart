import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:graduated_project/database/local_database.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickedImage;
    });
    print(_pickedImage);
    print(_pickedImage!.name);
    print(_pickedImage!.path);
  }

  // Future<void> _uploadImage() async {
  //   if (_pickedImage == null) {
  //     print('No image selected.');
  //     return;
  //   }
  //   print(_pickedImage!.name);
  //   var image = await MultipartFile.fromFile(_pickedImage!.path);
  //   // print("the image is $image");
  //   print(MultipartFile.fromFile(_pickedImage!.path));
  //   final dio = Dio();
  //   final formData = FormData.fromMap({
  //     'image': "jnjmk",
  //   });

  //   try {
  //     final response = await dio.post(
  //       'https://project2.amit-learning.com/api/user/profile/portofolios',
  //       data: formData,
  //       options: Options(headers: {
  //         'Authorization': 'Bearer 1|6n7o8bTpDKVp2djRDhlEUvcJqu0mVJhqLG2K7EDK',
  //         'Content-Type': 'application/json',
  //         "Accept": "application/json",
  //       }, validateStatus: (_) => true),
  //     );

  //     print('Upload successful. Response: ${response.data}');
  //   } catch (e) {
  //     print('Error uploading image: $e');
  //   }
  // }

  Future<FormData> createFormData() async {
    return FormData.fromMap({
      'name_image': 'profile',
      'image': await MultipartFile.fromFile(_pickedImage!.path),
    });
  }

  Dio dio = Dio(
    BaseOptions(
      contentType: 'multipart/form-data',
      headers: {
        'Authorization': 'Bearer 1|6n7o8bTpDKVp2djRDhlEUvcJqu0mVJhqLG2K7EDK',
      },
    ),
  );

  Future<void> sendToServer() async {
    FormData formData = await createFormData();
    try {
      final response = await dio.post(
        'https://project2.amit-learning.com/api/user/profile/portofolios',
        data: formData,
      );
      print('Response: $response');
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_pickedImage != null) Image.file(File(_pickedImage!.path)),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: sendToServer,
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
