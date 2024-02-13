import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/product_entity.dart';

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
    return List.generate(
        productsEntity.length,
        (index) => Product(
            name: productsEntity[index].name,
            description: productsEntity[index].description,
            imageUrl: productsEntity[index].imageUrl,
            price: productsEntity[index].price,
            category: productsEntity[index].category,
            currency: productsEntity[index].currency,
            id: productsEntity[index].id));
  }

  @override
  ProductsResponseEntity restore(List<Product> data) {
    var productEntityList = List.generate(
        data.length,
        (index) => ProductEntity(
            name: data[index].name,
            description: data[index].description,
            imageUrl: data[index].imageUrl,
            category: data[index].category,
            price: data[index].price,
            currency: data[index].currency,
            id: data[index].id));

    return ProductsResponseEntity(productEntityList);
  }
}
