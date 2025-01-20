
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/recipe_service.dart';
import '../widgets/recipe_card.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final RecipeService _recipeService = RecipeService();
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    try {
      final recipes = await _recipeService.fetchRecipes();
      setState(() {
        _recipes = recipes;
        _isLoading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading recipes: $e');
      }
    }
  }

  Future<void> _addRecipe() async {
    final newRecipe = {'title': 'New Recipe', 'description': 'Delicious Dish'};
    try {
      final recipe = await _recipeService.addRecipe(newRecipe);
      setState(() {
        _recipes.add(recipe);
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error adding recipe: $e');
      }
    }
  }

/* Future<void> _addRecipe(Map<String, dynamic> recipeData) async {
    final url = Uri.parse('https://dummyjson.com/recipes/add'); // Use the correct endpoint
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(recipeData),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (kDebugMode) {
        print('Recipe added successfully');
      }
    } else {
      throw Exception('Failed to add recipe. Status Code: ${response.statusCode}');
    }
  }
*/


  Future<void> _updateRecipe(int id) async {
    final updatedData = {'title': 'Updated Recipe'};
    try {
      final updatedRecipe = await _recipeService.updateRecipe(id, updatedData);
      final index = _recipes.indexWhere((recipe) => recipe.id == id);
      if (index != -1) {
        setState(() {
          _recipes[index] = updatedRecipe;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating recipe: $e');
      }
    }
  }

  Future<void> _deleteRecipe(int id) async {
    try {
      await _recipeService.deleteRecipe(id);
      setState(() {
        _recipes.removeWhere((recipe) => recipe.id == id);
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting recipe: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          final recipe = _recipes[index];
          return RecipeCard(
            recipe: recipe,
            onEdit: () => _updateRecipe(recipe.id),
            onDelete: () => _deleteRecipe(recipe.id),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          _addRecipe();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
