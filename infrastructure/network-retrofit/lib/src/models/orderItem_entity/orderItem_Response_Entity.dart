import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/orderItem_entity/orderItem_entity.dart';
part 'orderItem_Response_Entity.g.dart';
@JsonSerializable()
class OrderItemResponseEntity
    implements BaseLayerDataTransformer<OrderItemResponseEntity, OrderItem> {
  @JsonKey(name: 'data')
  OrderItemEntity orderItemEntity;

  OrderItemResponseEntity(this.orderItemEntity);

  @override
  OrderItemResponseEntity restore(OrderItem data) {
    return OrderItemResponseEntity(OrderItemEntity(orderId: data.orderId,
        paymentMode: data.paymentMode,
        deliveryDate: data.deliveryDate,
        address: data.address, product: data.product));
  }

  @override
  OrderItem transform() {
    return OrderItem(product: orderItemEntity.product, orderId: orderItemEntity.orderId,
        paymentMode: orderItemEntity.paymentMode,
        deliveryDate: orderItemEntity.deliveryDate, address: orderItemEntity.address);
  }
}