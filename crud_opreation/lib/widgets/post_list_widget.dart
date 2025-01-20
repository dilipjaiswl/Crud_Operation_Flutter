import 'package:flutter/material.dart';


class PostListWidget extends StatelessWidget {
  final List<PostModel> posts;

  const PostListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text(post.title),
          subtitle: Text(post.body),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Handle Delete Post
            },
          ),
        );
      },
    );
  }
}
