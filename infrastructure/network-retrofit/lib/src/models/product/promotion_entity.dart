import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promotion_entity.g.dart';

@JsonSerializable()
class PromotionEntity
    implements BaseLayerDataTransformer<PromotionEntity, Promotion> {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'productId')
  final int productId;
  @JsonKey(name: 'productImage')
  final String productImage;
  @JsonKey(name: 'productName')
  final String productName;
  @JsonKey(name: 'promotionLabels')
  final List<String> promotionLabels;

  PromotionEntity(
      {required this.id,
      required this.productId,
      required this.productImage,
      required this.productName,
      required this.promotionLabels});

  factory PromotionEntity.fromJson(Map<String, dynamic> json) =>
      _$PromotionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionEntityToJson(this);

  @override
  PromotionEntity restore(Promotion data) {
    return PromotionEntity(
        id: data.id,
        productId: data.productId,
        productImage: data.productImage,
        productName: data.productName,
        promotionLabels: data.promotionLabels);
  }

  @override
  Promotion transform() {
    return Promotion(
        id: id,
        productId: productId,
        productImage: productImage,
        productName: productName,
        promotionLabels: promotionLabels);
  }
}
