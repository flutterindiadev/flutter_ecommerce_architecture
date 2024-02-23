import 'package:data/data.dart';
import 'package:network_retrofit/src/models/address/address_entity.dart';
import 'package:network_retrofit/src/models/product/product_entity.dart';

import 'order_item_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'orderitems_response_entity.g.dart';

@JsonSerializable()
class OrderItemsResponseEntity
    implements
        BaseLayerDataTransformer<OrderItemsResponseEntity, List<OrderItem>> {
  @JsonKey(name: 'data')
  final List<OrderItemEntity> orderItemsEntity;

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
            orderId: e.orderId,
            product: Product(
                id: e.product.id,
                name: e.product.name,
                description: e.product.description,
                imageUrl: e.product.imageUrl,
                price: e.product.price,
                category: e.product.category,
                currencyId: e.product.currencyId),
            paymentMode: e.paymentMode,
            deliveryDate: e.deliveryDate,
            address: Address(
                id: e.address.id,
                streetName: e.address.streetName,
                country: e.address.apartment,
                city: e.address.city,
                pincode: e.address.pincode,
                floor: e.address.floor,
                building: e.address.building,
                apartment: e.address.apartment)))
        .toList();
  }

  @override
  OrderItemsResponseEntity restore(List<OrderItem> data) {
    return OrderItemsResponseEntity(
      orderItemsEntity: data
          .map((e) => OrderItemEntity(
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
                  price: e.product.price)))
          .toList(),
    );
  }
}
