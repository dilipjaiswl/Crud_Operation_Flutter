
class PostsModel {
  PostsModel({
      num? userId, 
      num? id, 
      String? title, 
      String? body,}){
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
}

  PostsModel.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
  }
  num? _userId;
  num? _id;
  String? _title;
  String? _body;
PostsModel copyWith({  num? userId,
  num? id,
  String? title,
  String? body,
}) => PostsModel(  userId: userId ?? _userId,
  id: id ?? _id,
  title: title ?? _title,
  body: body ?? _body,
);
  num? get userId => _userId;
  num? get id => _id;
  String? get title => _title;
  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }
  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: json['id'],
      title: json['title'] ?? 'No Title', // Provide default value
      body: json['body'] ?? 'No Body',   // Provide default value
    );
  }

}