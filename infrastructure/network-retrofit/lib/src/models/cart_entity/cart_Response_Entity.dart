
import 'package:json_annotation/json_annotation.dart';
import 'package:data/data.dart';
import 'package:network_retrofit/src/models/product_entity.dart';
import 'package:network_retrofit/src/models/cart_entity/cart_entity.dart';
part 'cart_Response_Entity.g.dart';

@JsonSerializable()
class CartResponseEntity
    implements BaseLayerDataTransformer<CartResponseEntity, Cart> {
  @JsonKey(name: 'data')
  CartEntity cartentity;
  CartResponseEntity(this.cartentity);
  @override
  CartResponseEntity restore(Cart data) {
    return CartResponseEntity(CartEntity(cartId: data.cartId, cartTotal: data.cartTotal,
        productCount: data.productCount, productlist: data.productlist.map((e) => ProductEntity(name: e.name, description: e.description,
        imageUrl: e.imageUrl, price: e.price, category: e.category, currencyId: e.currencyId)).toList()));
  }

  @override
  Cart transform() {

    return Cart(productlist: cartentity.productlist.map((e) =>Product(
        name: e.name, description: e.description,
        imageUrl: e.imageUrl,
        price: e.price, category: e.category,
        currencyId: e.currencyId)).toList(),
        productCount: cartentity.productCount,
        cartTotal: cartentity.cartTotal, cartId: cartentity.cartId);
  }
}