import 'package:api_integration_http/services/remote_service.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post>? fetchPosts;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    fetchPosts = await RemoteService().getPosts();
    if (fetchPosts != null) {
      setState(() {
        isLoaded = true;
      });
    }
    else {
      setState(() {
        isLoaded = false; // Indicates no data loaded
      });
    }
  }

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Post")),
        backgroundColor: Colors.cyanAccent,
      ),
      body: ListView.builder(
          itemCount: fetchPosts?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(fetchPosts![index].title),
            );
          }),
    );
  }
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Post")),
        backgroundColor: Colors.cyanAccent,
      ),
      body: isLoaded
          ? fetchPosts != null
          ? ListView.builder(
        itemCount: fetchPosts!.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text( fetchPosts![index].title,
                style: const TextStyle(fontSize: 16)),
          );
        },
      );
         // : const Center(child: Text("No posts available"))
         // : const Center(child: CircularProgressIndicator()),
    );
  }*/

}
