import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'order_cancel_entity.dart';

part 'order_cancel_response_entity.g.dart';

@JsonSerializable()
class OrderCancelResponseEntity
    implements
        BaseLayerDataTransformer<OrderCancelResponseEntity, OrderCancel> {
  @JsonKey(name: 'data')
  OrderCancelEntity orderCancelEntity;

  OrderCancelResponseEntity({required this.orderCancelEntity});

  factory OrderCancelResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderCancelResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderCancelResponseEntityToJson(this);

  @override
  OrderCancelResponseEntity restore(OrderCancel data) {
    return OrderCancelResponseEntity(
        orderCancelEntity: OrderCancelEntity(status: data.status));
  }

  @override
  OrderCancel transform() {
    return OrderCancel(status: orderCancelEntity.status);
  }
}
