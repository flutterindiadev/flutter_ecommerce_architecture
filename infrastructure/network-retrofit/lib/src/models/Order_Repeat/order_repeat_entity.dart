import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_repeat_entity.g.dart';

@JsonSerializable()
class OrderRepeatEntity
    implements BaseLayerDataTransformer<OrderRepeatEntity, OrderRepeat> {
  @JsonKey(name: 'status')
  bool status;

  OrderRepeatEntity({required this.status});

  factory OrderRepeatEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderRepeatEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRepeatEntityToJson(this);

  @override
  OrderRepeatEntity restore(OrderRepeat data) {
    return OrderRepeatEntity(status: status);
  }

  @override
  OrderRepeat transform() {
    return OrderRepeat(status: status);
  }
}
