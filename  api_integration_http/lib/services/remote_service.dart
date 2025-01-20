import 'package:flutter/foundation.dart';

import '../models/post_model.dart';
import 'package:http/http.dart' as http;
class RemoteService{
  Future<List<Post>?> getPosts() async{

  final client =http.Client();
  final response =await client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
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
}