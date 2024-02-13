import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/product_entity.dart';

part 'product_response_entity.g.dart';

@JsonSerializable()
class ProductResponseEntity
    implements BaseLayerDataTransformer<ProductResponseEntity, Product> {
  @JsonKey(name: 'data')
  final ProductEntity productEntity;

  ProductResponseEntity(this.productEntity);

  factory ProductResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseEntityToJson(this);

  @override
  Product transform() {
    return Product(
        name: productEntity.name,
        description: productEntity.description,
        imageUrl: productEntity.imageUrl,
        price: productEntity.price,
        category: productEntity.category,
        currency: productEntity.currency,
        id: productEntity.id);
  }

  @override
  ProductResponseEntity restore(Product data) {
    return ProductResponseEntity(ProductEntity(
        id: data.id,
        currency: data.currency,
        name: data.name,
        description: data.description,
        imageUrl: data.imageUrl,
        category: data.category,
        price: data.price));
  }
}
