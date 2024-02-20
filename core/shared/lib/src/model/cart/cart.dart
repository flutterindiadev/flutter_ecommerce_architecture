import 'package:shared/shared.dart';

class Cart {
  String cartId;
  List<Product> productlist;
  int productCount;

  double cartTotal;

  Cart(
      {required this.cartId,
      required this.productlist,
      required this.productCount,
      required this.cartTotal});
}
