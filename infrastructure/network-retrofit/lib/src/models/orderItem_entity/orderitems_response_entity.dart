import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/address/address_entity.dart';
import 'package:network_retrofit/src/models/product/product_entity.dart';

import 'order_item_entity.dart';
import 'order_item_response_entity.dart';

part 'orderitems_response_entity.g.dart';

@JsonSerializable()
class OrderItemsResponseEntity
    implements
        BaseLayerDataTransformer<OrderItemsResponseEntity, List<OrderItem>> {
  @JsonKey(name: 'data')
  final List<OrderItemResponseEntity> orderItemsEntity;

  OrderItemsResponseEntity({
    required this.orderItemsEntity,
  });

  factory OrderItemsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderItemsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemsResponseEntityToJson(this);

  @override
  List<OrderItem> transform() {
    return orderItemsEntity
        .map((e) => OrderItem(
            orderId: e.orderItemEntity.orderId,
            product: Product(
                id: e.orderItemEntity.product.id,
                name: e.orderItemEntity.product.name,
                description: e.orderItemEntity.product.description,
                imageUrl: e.orderItemEntity.product.imageUrl,
                price: e.orderItemEntity.product.price,
                category: e.orderItemEntity.product.category,
                currencyId: e.orderItemEntity.product.currencyId),
            paymentMode: e.orderItemEntity.paymentMode,
            deliveryDate: e.orderItemEntity.deliveryDate,
            address: Address(
                id: e.orderItemEntity.address.id,
                streetName: e.orderItemEntity.address.streetName,
                country: e.orderItemEntity.address.apartment,
                city: e.orderItemEntity.address.city,
                pincode: e.orderItemEntity.address.pincode,
                floor: e.orderItemEntity.address.floor,
                building: e.orderItemEntity.address.building,
                apartment: e.orderItemEntity.address.apartment)))
        .toList();
  }

  @override
  OrderItemsResponseEntity restore(List<OrderItem> data) {
    return OrderItemsResponseEntity(
      orderItemsEntity: data
          .map((e) => OrderItemResponseEntity(OrderItemEntity(
              orderId: e.orderId,
              paymentMode: e.paymentMode,
              deliveryDate: e.deliveryDate,
              address: AddressEntity(
                  id: e.address.id,
                  streetName: e.address.streetName,
                  country: e.address.country,
                  city: e.address.city,
                  pincode: e.address.pincode,
                  floor: e.address.floor,
                  building: e.address.building,
                  apartment: e.address.apartment),
              product: ProductEntity(
                  id: e.product.id,
                  currencyId: e.product.currencyId,
                  name: e.product.name,
                  description: e.product.description,
                  imageUrl: e.product.imageUrl,
                  category: e.product.category,
                  price: e.product.price))))
          .toList(),
    );
  }
}
