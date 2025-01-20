import 'package:flutter/material.dart';

import '../http_helper_method.dart';
import 'edit_post.dart';


class PostDetails extends StatelessWidget {
  PostDetails(this.itemId, {super.key}) {
    _futurePost = HTTPHelper().getItem(itemId);
  }

  String itemId;
  late Future<Map> _futurePost;
  late Map post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => EditPost(post)));
          }, icon: const Icon(Icons.edit)),
          IconButton(onPressed: () async{
            //Delete
            bool deleted=await HTTPHelper().deleteItem(itemId);

            if(deleted)
            {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Post deleted')));
            }
            else
            {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Failed to delete')));
            }
          }, icon: const Icon(Icons.delete)),
        ],
      ),
      body: FutureBuilder<Map>(
        future: _futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            post = snapshot.data!;

            return Column(
              children: [
                Text(
                  '${post['title']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${post['body']}'),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}