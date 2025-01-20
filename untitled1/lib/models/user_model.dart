import 'dart:convert';

import 'name_model.dart';

class UserModel{
  late final String email;
  late final String picture;
  late final NameModel name;

  UserModel({
    required this.email,
    required this.picture,
    required this.name,
});
  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
    email: json['email'],
    picture: json['picture']['medium'],
    name: NameModel.fromJson(json['name'])

    );

  }
}