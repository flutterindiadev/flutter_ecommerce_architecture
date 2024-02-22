import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'order_repeat_entity.dart';
part 'order_repeat_response_entity.g.dart';

@JsonSerializable()
class OrderRepeatResponseEntity
    implements
        BaseLayerDataTransformer<OrderRepeatResponseEntity, OrderRepeat> {
  @JsonKey(name: 'data')
  OrderRepeatEntity orderRepeatEntity;

  OrderRepeatResponseEntity({required this.orderRepeatEntity});

  factory OrderRepeatResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderRepeatResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRepeatResponseEntityToJson(this);

  @override
  OrderRepeatResponseEntity restore(OrderRepeat data) {
    return OrderRepeatResponseEntity(
        orderRepeatEntity: OrderRepeatEntity(status: data.status));
  }

  @override
  OrderRepeat transform() {
    return OrderRepeat(status: orderRepeatEntity.status);
  }
}
