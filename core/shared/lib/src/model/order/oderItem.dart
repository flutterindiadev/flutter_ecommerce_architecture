import '../../../shared.dart';

class OrderItem{
  String orderId;
  Product product;
  String paymentMode;
  String deliveryDate;
  Address address;

  OrderItem(
      {required this.orderId,
     required this.product,
     required this.paymentMode,
     required this.deliveryDate,
      required this.address});
}