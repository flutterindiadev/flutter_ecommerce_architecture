import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProductEntity
    implements BaseLayerDataTransformer<ProductEntity, Product> {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  @JsonKey(name: 'discount')
  double? discount;
  @JsonKey(name: 'category')
  final String category;
  @JsonKey(name: 'price')
  final double price;

  ProductEntity(
      {required this.name,
      required this.description,
      required this.imageUrl,
      required this.category,
      required this.price});

  @override
  ProductEntity restore(data) {
    return ProductEntity(
        name: data.name,
        description: data.description,
        imageUrl: data.imageUrl,
        category: data.category,
        price: data.price);
  }

  @override
  Product transform() {
    return Product(
        name: name,
        description: description,
        imageUrl: imageUrl,
        price: price,
        category: category);
  }
}
