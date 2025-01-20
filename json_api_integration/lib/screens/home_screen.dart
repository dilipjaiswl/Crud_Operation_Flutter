
import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../services/remote_service.dart';
import 'detail_screen.dart';

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

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Post")),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
          itemCount: 46,
          itemBuilder: (context, index) {
            return Container(
              child: Text("hiii"),
            );
          }),
    );
  }*/
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Post")),
        backgroundColor: Colors.blueAccent,
      ),
      body: isLoaded
          ? fetchPosts != null
          ? ListView.builder(
        itemCount: fetchPosts!.length,
        itemBuilder: (context, index) {
         /* // Shortened version of title and body
          String shortTitle = fetchPosts![index].title.length > 30
              ? "${fetchPosts![index].title.substring(0, 30)}..."
              : fetchPosts![index].title;

          String shortBody = (fetchPosts![index].body ?? "").length > 50
              ? "${fetchPosts![index].body!.substring(0, 50)}..."
              : fetchPosts![index].body ?? "";*/
          return GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                  builder: (context) => DetailScreen(post: fetchPosts![index],)
                  )
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(

                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                title: Text(
                 "Title: ${fetchPosts![index].title} ...",
                  maxLines: 1,// Limit title to 1 line
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20),//Show '...' if text overflows
                ),
                subtitle: Text(
                  "Body: ${fetchPosts![index].body??"Body Not Available"} ...",
                  maxLines: 1,// Limit title to 1 line
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),//Show '...' if text overflows
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
                ),


                /*child: ListTile(
                  title: Text(
                    fetchPosts![index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    fetchPosts![index].body ?? "No body available",//?? bz it is not required type
                    style: const TextStyle(fontSize: 14),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                )*/
            /*  child: Text( fetchPosts![index].title,
                  style: const TextStyle(fontSize: 16)),*/
            );
        },
      )
          : const Center(child: Text("No posts available"))
          : const Center(child: CircularProgressIndicator()),
    );
  }

}
