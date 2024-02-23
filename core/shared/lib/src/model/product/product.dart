class Product {
  int id;
  String name;
  String description;
  String imageUrl;
  double price;
  String category;
  double? discount;

  String currencyId;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.category,
      this.discount,
      required this.currencyId});
}
