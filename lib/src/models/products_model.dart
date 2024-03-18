class ProductsModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  ProductsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {

    return ProductsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? '',
      category: json['category'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      images: List<String>.from(json['images']),
    );
  }
}
