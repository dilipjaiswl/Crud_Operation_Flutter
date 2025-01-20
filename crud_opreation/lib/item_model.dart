class Item {
  final int id;
  final String name;
  final String description;

  Item({required this.id, required this.name, required this.description});

  // Factory constructor to create an Item from JSON
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  // Convert an Item to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
