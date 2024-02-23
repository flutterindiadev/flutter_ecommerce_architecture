import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/order_rating/order_rating_entity.dart';
part 'order_rating_response_entity.g.dart';

@JsonSerializable()
class OrderRatingResponseEntity
    implements
        BaseLayerDataTransformer<OrderRatingResponseEntity, OrderRating> {
  @JsonKey(name: 'data')
  OrderRatingEntity orderRatingEntity;

  OrderRatingResponseEntity({required this.orderRatingEntity});

  factory OrderRatingResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderRatingResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRatingResponseEntityToJson(this);

  @override
  OrderRatingResponseEntity restore(OrderRating data) {
    return OrderRatingResponseEntity(
        orderRatingEntity: OrderRatingEntity(status: data.status));
  }

  @override
  OrderRating transform() {
    return OrderRating(status: orderRatingEntity.status);
  }
}
