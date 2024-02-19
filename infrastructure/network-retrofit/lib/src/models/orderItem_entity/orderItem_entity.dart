import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class OrderItemEntity implements BaseLayerDataTransformer<OrderItemEntity, OrderItem>{
  @JsonKey(name: 'orderId')
  String orderId;

  @JsonKey(name: 'product')
  Product product;
  @JsonKey(name: 'paymentMode')
  String paymentMode;
  @JsonKey(name: 'deliveryDate')
  String deliveryDate;
  @JsonKey(name: 'address')
  String address;


  OrderItemEntity({required this.orderId, required this.paymentMode, required this.deliveryDate,
   required this.address,required this.product});

  @override
  OrderItemEntity restore(OrderItem data) {
   return OrderItemEntity(orderId: orderId, paymentMode: paymentMode,
       deliveryDate: deliveryDate, address: address,
       product: product);
  }

  @override
  OrderItem transform() {
   return OrderItem(product: product, orderId: orderId,
       paymentMode: paymentMode, deliveryDate: deliveryDate,
       address: address);
  }
}