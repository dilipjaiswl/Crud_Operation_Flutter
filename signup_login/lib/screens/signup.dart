import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  
  login(String email, password) async{
    try{
      Response  response =await post(Uri.parse("https://reqres.in/api/register"),
        body:{
          "email":email,
          "password":password
          }
      );
          if(response.statusCode ==200){
            var data=jsonDecode(response.body.toString());
            print(data);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("Account Created Successfully"),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 3),
              )
            );
          }else {
            // Show error Snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(" Failed! to Create Account"),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
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
        title: Center(child: Text("Sign Up")),
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
                    child: Text("Sign Up"),)),
            )
          ],
        ),
      ),
    );
  }
}
