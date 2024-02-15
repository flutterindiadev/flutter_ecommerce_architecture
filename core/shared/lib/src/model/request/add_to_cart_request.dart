import 'package:shared/shared.dart';

class AddtoCartRequest{
  String cartId;
  Product product;

  AddtoCartRequest({required this.product,required this.cartId});
}