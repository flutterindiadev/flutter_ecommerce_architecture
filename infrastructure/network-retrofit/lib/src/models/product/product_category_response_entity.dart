import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/product/product_category_entity.dart';

part 'product_category_response_entity.g.dart';

@JsonSerializable()
class ProductCategoryResponseEntity
    implements
        BaseLayerDataTransformer<ProductCategoryResponseEntity,
            List<ProductCategory>> {
  final List<ProductCategoryEntity> productCategoryEntity;

  ProductCategoryResponseEntity(this.productCategoryEntity);

  factory ProductCategoryResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryResponseEntityToJson(this);

  @override
  ProductCategoryResponseEntity restore(List<ProductCategory> data) {
    return ProductCategoryResponseEntity(data
        .map((e) => ProductCategoryEntity(
            id: e.id, categoryName: e.categoryName, imageUrl: e.imageUrl))
        .toList());
  }

  @override
  List<ProductCategory> transform() {
    return productCategoryEntity
        .map((e) => ProductCategory(
            categoryName: e.categoryName, id: e.id, imageUrl: e.imageUrl))
        .toList();
  }
}
