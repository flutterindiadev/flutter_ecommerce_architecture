import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/address/address_entity.dart';

part 'order_status_response_entity.g.dart';

@JsonSerializable()
class OrderStatusResponseEntity
    implements
        BaseLayerDataTransformer<OrderStatusResponseEntity, OrderStatus> {
  String trackingId;
  String orderId;
  String orderStatus;
  AddressEntity destination;

  OrderStatusResponseEntity(
      {required this.destination,
      required this.orderId,
      required this.orderStatus,
      required this.trackingId});

  factory OrderStatusResponseEntity.fromJson(Map<String, dynamic> json) {
    return _$OrderStatusResponseEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderStatusResponseEntityToJson(this);

  @override
  OrderStatusResponseEntity restore(OrderStatus data) {
    return OrderStatusResponseEntity(
        destination: AddressEntity(
            id: data.destination.id,
            streetName: data.destination.streetName,
            country: data.destination.country,
            city: data.destination.city,
            pincode: data.destination.pincode,
            floor: data.destination.floor,
            building: data.destination.building,
            apartment: data.destination.apartment),
        orderId: orderId,
        orderStatus: orderStatus,
        trackingId: trackingId);
  }

  @override
  OrderStatus transform() {
    return OrderStatus(
        destination: Address(
            id: destination.id,
            streetName: destination.streetName,
            country: destination.country,
            city: destination.city,
            pincode: destination.pincode,
            floor: destination.floor,
            building: destination.building,
            apartment: destination.apartment),
        orderId: orderId,
        orderStatus: orderStatus,
        trackingId: trackingId);
  }
}
