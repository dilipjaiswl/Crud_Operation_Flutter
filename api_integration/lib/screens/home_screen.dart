import 'dart:convert';

import 'package:api_integration/models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModel> postList =[] ;
  Future<List<PostsModel>> getPostApi()async {
      final response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      final data =jsonDecode(response.body.toString());
      if(response.statusCode ==200){
        postList.clear();             //Hot reload will not be happened
        for(Map json in data){
          postList.add(PostsModel.fromJson(json));
        }
        return postList;
      }
      else {
        return postList;
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Api Integration")),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                   // return const Text("Loading");
                    return  const Center(child: CircularProgressIndicator(color: Colors.blueAccent));
                  }else{
                    return ListView.builder(
                      itemCount: postList.length,
                        itemBuilder: (context ,index){
                          return  GestureDetector(
                            onTap: () {
                              // Navigate to DetailsScreen with title and body
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    title: postList[index].title,
                                    body: postList[index].body,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding:const EdgeInsets.all(5.0),
                              child: Card(
                                color:Colors.blueAccent,
                                shadowColor:Colors.blueAccent,
                                elevation: 20.0,
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Id: ${postList[index].id.toString()}",  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                   // const SizedBox(height: 2,),
                                    const Text("Title:", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    Text(postList[index].title.toString()),
                                    const Text("Body:", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    Text(postList[index].body.toString())
                                  ],
                                ),
                              ),
                            ),
                          );
                    }
                    );
                  }
                }
            ),
          ),
        ],
      ),
    );
  }
}
