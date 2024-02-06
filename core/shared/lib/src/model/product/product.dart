class Product {
  String name;
  String description;
  String imageUrl;
  double price;
  String category;
  double? discount;
  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    this.discount,
  });
}
