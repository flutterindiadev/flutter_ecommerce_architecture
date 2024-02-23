import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/address/address_entity.dart';
import 'package:network_retrofit/src/models/orderItem_entity/order_item_entity.dart';
import 'package:network_retrofit/src/models/product/product_entity.dart';

part 'order_item_response_entity.g.dart';

@JsonSerializable()
class OrderItemResponseEntity
    implements BaseLayerDataTransformer<OrderItemResponseEntity, OrderItem> {
  @JsonKey(name: 'data')
  OrderItemEntity orderItemEntity;

  OrderItemResponseEntity(this.orderItemEntity);
  factory OrderItemResponseEntity.fromJson(Map<String, dynamic> json) {
    return _$OrderItemResponseEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderItemResponseEntityToJson(this);

  @override
  OrderItemResponseEntity restore(OrderItem data) {
    final productEntity = ProductEntity(
        id: data.product.id,
        currencyId: data.product.currencyId,
        name: data.product.name,
        description: data.product.description,
        imageUrl: data.product.imageUrl,
        category: data.product.category,
        price: data.product.price);
    final addressEntity = AddressEntity(
        id: data.address.id,
        streetName: data.address.streetName,
        country: data.address.country,
        city: data.address.city,
        pincode: data.address.pincode,
        floor: data.address.floor,
        building: data.address.building,
        apartment: data.address.apartment);
    return OrderItemResponseEntity(OrderItemEntity(
        orderId: data.orderId,
        paymentMode: data.paymentMode,
        deliveryDate: data.deliveryDate,
        address: addressEntity,
        product: productEntity));
  }

  @override
  OrderItem transform() {
    return OrderItem(
        product: orderItemEntity.product.transform(),
        orderId: orderItemEntity.orderId,
        paymentMode: orderItemEntity.paymentMode,
        deliveryDate: orderItemEntity.deliveryDate,
        address: orderItemEntity.address.transform());
  }
}
