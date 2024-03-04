import 'package:shared/shared.dart';

class OrderStatus {
  String trackingId;
  String orderId;
  String orderStatus;
  Address destination;

  OrderStatus(
      {required this.destination,
      required this.orderId,
      required this.orderStatus,
      required this.trackingId});
}
