import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class RecipeService {
  final String baseUrl = 'https://dummyjson.com/recipes';

  // Fetch all recipes
  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['recipes'] as List)
          .map((recipe) => Recipe.fromJson(recipe))
          .toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  // Add a new recipe
  Future<Recipe> addRecipe(Map<String, dynamic> recipeData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(recipeData),
    );
    if (response.statusCode == 200) {
      return Recipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add recipe');
    }
  }

  // Update an existing recipe
  Future<Recipe> updateRecipe(int id, Map<String, dynamic> updatedData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedData),
    );
    if (response.statusCode == 200) {
      return Recipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update recipe');
    }
  }

  // Delete a recipe
  Future<void> deleteRecipe(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete recipe');
    }
  }
}
