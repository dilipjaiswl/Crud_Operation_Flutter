

import 'package:flutter/material.dart';

import '../item_services.dart';
import '../models/post_model.dart';
import '../widgets/post_list_widget.dart';


class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Example'),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: apiService.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Posts Found'));
          } else {
            return PostListWidget(posts: snapshot.data!);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle Add Post Logic
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
