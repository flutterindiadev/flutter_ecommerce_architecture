import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../address/address_entity.dart';
import '../product/product_entity.dart';

part 'order_item_entity.g.dart';

@JsonSerializable()
class OrderItemEntity
    implements BaseLayerDataTransformer<OrderItemEntity, OrderItem> {
  @JsonKey(name: 'orderId')
  String orderId;
  @JsonKey(name: 'product')
  ProductEntity product;
  @JsonKey(name: 'paymentMode')
  String paymentMode;
  @JsonKey(name: 'deliveryDate')
  String deliveryDate;
  @JsonKey(name: 'address')
  AddressEntity address;

  OrderItemEntity(
      {required this.orderId,
      required this.paymentMode,
      required this.deliveryDate,
      required this.address,
      required this.product});

  factory OrderItemEntity.fromJson(Map<String, dynamic> json) {
    return _$OrderItemEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderItemEntityToJson(this);

  @override
  OrderItemEntity restore(OrderItem data) {
    return OrderItemEntity(
        orderId: orderId,
        paymentMode: paymentMode,
        deliveryDate: deliveryDate,
        address: address,
        product: product);
  }

  @override
  OrderItem transform() {
    return OrderItem(
        product: product.transform(),
        orderId: orderId,
        paymentMode: paymentMode,
        deliveryDate: deliveryDate,
        address: address.transform());
  }
}
