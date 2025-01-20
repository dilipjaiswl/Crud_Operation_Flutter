
// ignore_for_file: avoid_print


import 'package:http/http.dart' as http;
import 'package:rest_api/recipes_model.dart';

recipesItems() async {
  Uri url = Uri.parse("https://dummyjson.com/recipes");
  var res = await http.get(url);
  try {
    if (res.statusCode == 200) {
      var data = recipesModelFromJson(res.body);
      return data.recipes;
    } else {
      print("Error Occurred");
    }
  } catch (e) {
    print(e.toString());
  }
}
