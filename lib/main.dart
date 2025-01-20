import 'package:flutter/material.dart';
import 'package:login/shareddemo.dart';

void main() {
  runApp(const MyApp() );
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter App",
      theme:ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const Hello(),
    );
  }
}






