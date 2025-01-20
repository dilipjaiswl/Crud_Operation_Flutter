import 'package:crud_opreation/screens/post_details.dart';
import 'package:flutter/material.dart';

import '../http_helper_method.dart';
import 'add_post.dart';

class PostsList extends StatelessWidget {
  PostsList({super.key});

  final Future<List<Map>> _futurePosts = HTTPHelper().fetchItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddPost()));

        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Map>>(
        future: _futurePosts,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //Check for errors
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }
          //Has data arrived
          if (snapshot.hasData) {
            List<Map> posts = snapshot.data;

            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  Map thisItem = posts[index];
                  return ListTile(
                    title: Text('${thisItem['title']}'),
                    subtitle: Text('${thisItem['body']}'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PostDetails(thisItem['id'].toString())));
                    },
                  );
                });
          }

          //Display a loader
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}