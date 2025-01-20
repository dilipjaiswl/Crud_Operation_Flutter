import 'dart:convert';

class NameModel{
  late final String first;
  late final String last;
  //Named Constructor
  NameModel({required this.first, required this.last});
  factory NameModel.fromJson(Map<String,dynamic> json){
  return NameModel(
  first: json['first'],
  last: json['last']
,  );
  }
}
