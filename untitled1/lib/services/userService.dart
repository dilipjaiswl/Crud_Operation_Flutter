import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:untitled1/models/user_model.dart';
import 'package:http/http.dart' as http;
class UserService {
  Future<List<UserModel>?> getUser() async{
    const baseUrl = 'https://randomuser.me/api/?results=50';
    try{
      //Making the API call
      final response = await http.get(Uri.parse(baseUrl));

      // Checking if the response is successfully
      if(response.statusCode >=200 || response.statusCode <300){

        // Decode JSON
        final Map<String,dynamic> data = jsonDecode(response.body);

        // Access 'results' array
        final List<dynamic> results =data['results'];

        // Print some data
        for (var result in results) {
          final name = result['name'];
          if (kDebugMode) {
            print('Name: ${name['title']} ${name['first']} ${name['last']}');
          }
        }
      }
      else{
       if (kDebugMode) {
         print('Failed to load Data StatusCode :${response.statusCode}');
       }
      }
    }catch(e){
      if (kDebugMode) {
        print('An error occurred: $e');
      }

    }
    return null;
}
}