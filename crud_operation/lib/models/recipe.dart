class Recipe {
  final int id;
  final String title;
  final String description;

  Recipe({required this.id, required this.title, required this.description});

  // Factory method to create a Recipe object from JSON
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
    );
  }

  // Convert Recipe object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
