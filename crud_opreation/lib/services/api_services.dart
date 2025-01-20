import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/post_model.dart';

class ApiService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception("Failed to load posts");
    }
  }

  Future<void> createPost(PostModel post) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception("Failed to create post");
    }
  }

  Future<void> updatePost(int id, PostModel post) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to update post");
    }
  }

  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete post");
    }
  }
}
