import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/product/product_entity.dart';

part 'products_response_entity.g.dart';

@JsonSerializable()
class ProductsResponseEntity
    implements BaseLayerDataTransformer<ProductsResponseEntity, List<Product>> {
  @JsonKey(name: 'data')
  final List<ProductEntity> productsEntity;

  ProductsResponseEntity(this.productsEntity);

  factory ProductsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseEntityToJson(this);

  @override
  List<Product> transform() {
    return productsEntity
        .map((e) => Product(
            id: e.id,
            name: e.name,
            description: e.description,
            imageUrl: e.imageUrl,
            price: e.price,
            category: e.category,
            currencyid: e.currencyid))
        .toList();
  }

  @override
  ProductsResponseEntity restore(List<Product> data) {
    return ProductsResponseEntity(data
        .map((e) => ProductEntity(
            id: e.id,
            currencyid: e.currencyid,
            name: e.name,
            description: e.description,
            imageUrl: e.imageUrl,
            category: e.category,
            price: e.price))
        .toList());
  }
}
