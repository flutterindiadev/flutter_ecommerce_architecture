import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/product/promotion_entity.dart';

part 'promotions_response_entity.g.dart';

@JsonSerializable()
class PromotionsResponseEntity
    implements
        BaseLayerDataTransformer<PromotionsResponseEntity, List<Promotion>> {
  @JsonKey(name: 'data')
  List<PromotionEntity> productEntity;

  PromotionsResponseEntity({required this.productEntity});

  factory PromotionsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$PromotionsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionsResponseEntityToJson(this);

  @override
  PromotionsResponseEntity restore(List<Promotion> data) {
    return PromotionsResponseEntity(
        productEntity: data
            .map((e) => PromotionEntity(
                id: e.id,
                productId: e.productId,
                productImage: e.productImage,
                productName: e.productName,
                promotionLabels: e.promotionLabels))
            .toList());
  }

  @override
  List<Promotion> transform() {
    // TODO: implement transform
    throw UnimplementedError();
  }
}
