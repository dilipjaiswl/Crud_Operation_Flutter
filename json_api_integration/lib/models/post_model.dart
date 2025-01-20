/*
import 'dart:convert';

class Post {
  final int userId;
  final int id;
  final String title;
  final String? body;

  Post(
      {required this.userId, required this.id, required this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> toJson() =>
      {'userId': userId, 'id': id, 'title': title, 'body': body};
}

List<Post> postFromJson(String str) => List<Post>.from(
    json.decode(str).map((x) => Post.fromJson(json as Map<String, dynamic>)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
*/
import 'dart:convert';

class Post {
  final int userId;
  final int id;
  final String title;
  final String? body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'body': body,
  };
}

List<Post> postFromJson(String str) {
  return List<Post>.from(
    json.decode(str).map((x) => Post.fromJson(x as Map<String, dynamic>)),
  );
}

String postToJson(List<Post> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

