import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

  login(String email, password) async{
    try{
      Response  response =await post(Uri.parse("https://reqres.in/api/login"),
          body:{
            "email":email,
            "password":password
          }
      );
      if(response.statusCode ==200){
        var data=jsonDecode(response.body.toString());
        print(data); // Show success dialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Login Successful"),
              content: const Text("You have logged in successfully!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
        print("Login Successfully");
      }else {
        // Show error dialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Login Failed"),
              content: const Text("Invalid email or password."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
  }catch(e){
      print(e.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login")),
        backgroundColor: Colors.indigo.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: " Enter Email"
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: " Enter password"
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(),passwordController.text.toString());

              },
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text("Login"),)),
            )
          ],
        ),
      ),
    );
  }
}

