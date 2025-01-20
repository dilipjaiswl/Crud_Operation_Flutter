import 'package:flutter/material.dart';
import 'package:json_api_integration/screens/saved_screen.dart';
import '../models/post_model.dart';

class DetailScreen extends StatelessWidget {
  final Post post;

  const DetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Post Details"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Title:${post.title}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
             " Body:${post.body ?? "No body available"}",
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => SavedScreen()
                      )
                  );
                },

                child: Center(child: Text("Save")))
          ],
        ),
      ),
    );
  }
}

