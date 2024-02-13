import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/product_category_entity.dart';

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
    final List<ProductCategoryEntity> productCategoryResonseEntity =
        List.generate(
            productCategoryEntity.length,
            (index) => ProductCategoryEntity(
                id: data[index].id,
                categoryName: data[index].categoryName,
                imageUrl: data[index].imageUrl));

    return ProductCategoryResponseEntity(productCategoryResonseEntity);
  }

  @override
  List<ProductCategory> transform() {
    return List.generate(
        productCategoryEntity.length,
        (index) => ProductCategory(
            categoryName: productCategoryEntity[index].categoryName,
            id: productCategoryEntity[index].id,
            imageUrl: productCategoryEntity[index].imageUrl));
  }
}
