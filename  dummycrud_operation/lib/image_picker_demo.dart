//import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  State<ImagePickerDemo> createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  /*File? image;
  Future<void> _pickImageFormGalley() async{
    final pickedFile=await ImagePicker().pickImage(
      source:ImageSource.gallery
    );
  }
*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Image Picker")),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
