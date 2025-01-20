/*
import 'package:flutter/foundation.dart';
import '../models/post_model.dart';
import 'package:http/http.dart' as http;


class RemoteService{

  Future<List<Post>?> getPosts() async{
    final response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if(response.statusCode==200){
      var json =response.body;
      return postFromJson(json);
    }else{
      if (kDebugMode) {
        print("Failed to Load Data");
      }
    }
    return null;

  }
}*/
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    final client = http.Client();
    try {
      final response = await client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        var json = response.body;
        return postFromJson(json);
      } else {
        print("Failed to load posts: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching posts: $e");
    } finally {
      client.close();
    }
    return null;
  }
}

