import 'package:shared/src/model/product/currency.dart';

class Product {
  int id;
  String name;
  String description;
  String imageUrl;
  double price;
  String category;
  double? discount;
  Currency currency;
  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.category,
      this.discount,
      required this.currency});
}
