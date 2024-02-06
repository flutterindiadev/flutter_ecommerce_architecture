import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/product_entity.dart';

part 'product_response_entity.g.dart';

@JsonSerializable()
class ProductResponseEntity
    implements BaseLayerDataTransformer<ProductResponseEntity, List<Product>> {
  @JsonKey(name: 'data')
  final List<ProductEntity> productEntity;

  ProductResponseEntity(this.productEntity);

  factory ProductResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseEntityToJson(this);

  @override
  List<Product> transform() {
    return List.generate(
        productEntity.length,
        (index) => Product(
            name: productEntity[index].name,
            description: productEntity[index].description,
            imageUrl: productEntity[index].imageUrl,
            price: productEntity[index].price,
            category: productEntity[index].category));
  }

  @override
  ProductResponseEntity restore(List<Product> data) {
    var productEntityList = List.generate(
        data.length,
        (index) => ProductEntity(
            name: data[index].name,
            description: data[index].description,
            imageUrl: data[index].imageUrl,
            category: data[index].category,
            price: data[index].price));

    return ProductResponseEntity(productEntityList);
  }
}
