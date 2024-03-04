import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_category_entity.g.dart';

@JsonSerializable()
class ProductCategoryEntity
    implements
        BaseLayerDataTransformer<ProductCategoryEntity, ProductCategory> {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'categoryname')
  final String categoryName;

  @JsonKey(name: 'imageurl')
  final String imageUrl;

  ProductCategoryEntity(
      {required this.id, required this.categoryName, required this.imageUrl});

  factory ProductCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryEntityToJson(this);

  @override
  ProductCategoryEntity restore(ProductCategory data) {
    return ProductCategoryEntity(
        id: data.id, categoryName: data.categoryName, imageUrl: data.imageUrl);
  }

  @override
  ProductCategory transform() {
    return ProductCategory(
        categoryName: categoryName, id: id, imageUrl: imageUrl);
  }
}
