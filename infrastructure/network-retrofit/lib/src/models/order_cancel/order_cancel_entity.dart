import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_cancel_entity.g.dart';

@JsonSerializable()
class OrderCancelEntity implements BaseLayerDataTransformer<OrderCancelEntity,OrderCancel>{
  @JsonKey(name: 'status')
  bool status;

  OrderCancelEntity({required this.status});

  factory OrderCancelEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderCancelEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderCancelEntityToJson(this);


  @override
  OrderCancelEntity restore(OrderCancel data) {
   return OrderCancelEntity(status: status);
  }

  @override
  OrderCancel transform() {
  return OrderCancel(status: status);
  }
}