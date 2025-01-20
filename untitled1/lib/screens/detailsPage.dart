import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail Page"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Center(
          child: ElevatedButton(
              onPressed:()=>  goBack(context),
              child: const Text("Go Back")),
        )
    );
  }
  goBack(context){
  Navigator.pop(context);
  }
}
