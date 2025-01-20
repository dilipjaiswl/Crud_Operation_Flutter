import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text("Saved")),
        backgroundColor: Colors.greenAccent,
      ),
      body: SizedBox(
        height: 200,
        width: 400,
        child: Center(child: Text("Data Saved Successfully !!!",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),)),
      )
      );
  }
}
