class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
  bool isFavorite; // Added isFavorite

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    this.isFavorite = false, // Default value
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(), // Convert num to double
      category: json['category'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      isFavorite: json['isFavorite'] ?? false, // Default to false if not present
    );
  }
}