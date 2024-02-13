import 'package:data/data.dart';

import 'package:json_annotation/json_annotation.dart';

import '../../product_entity.dart';

@JsonSerializable()
class Cart_entity implements BaseLayerDataTransformer<Cart_entity, Cart>{

  @JsonKey(name: 'productlist')
 final  List<Product> productlist;
  @JsonKey(name: 'productCount')
 final  int productCount ;
  @JsonKey(name: 'quantity')
final  int quantity;
  @JsonKey(name: 'cartTotal')
final  double cartTotal;

  Cart_entity({required this.productlist,
    required  this.productCount,required this.quantity,
    required this.cartTotal});

  @override
  Cart_entity restore(data) {
    // TODO: implement restore
    return Cart_entity(productlist: data.productlist,
        productCount: data.productCount,
        quantity: data.quantity, cartTotal: data.cartTotal);
  }

  @override
  Cart transform() {
    // TODO: implement transform
   return Cart(productlist: productlist,
       productCount: productCount,
       quantity: quantity,
       cartTotal: cartTotal);
  }
}