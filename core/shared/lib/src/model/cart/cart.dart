
import 'package:shared/shared.dart';

class Cart{
  List<Product> productlist;
  int productCount ;
  int quantity;
  double cartTotal;

  Cart({required this.productlist,
    required  this.productCount,required this.quantity,
    required this.cartTotal});
}