
import 'package:json_annotation/json_annotation.dart';
import 'package:data/data.dart';
import 'package:network_retrofit/src/models/request/cart_entity/cart_entity.dart';

@JsonSerializable()
class CartResponseEntity
    implements BaseLayerDataTransformer<CartResponseEntity, Cart> {
  Cart_entity cart_entity;

  CartResponseEntity(this.cart_entity);

  @override
  CartResponseEntity restore(Cart data) {
    // TODO: implement restore
    return CartResponseEntity(Cart_entity(productlist: data.productlist,
        productCount: data.productCount, quantity: data.quantity, cartTotal: data.cartTotal,));
  }

  @override
  Cart transform() {
    // TODO: implement transform
    return Cart(productlist: cart_entity.productlist,
        productCount: cart_entity.productCount, quantity: cart_entity.quantity,
        cartTotal: cart_entity.cartTotal);
  }
}