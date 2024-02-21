import 'package:json_annotation/json_annotation.dart';
import 'package:data/data.dart';

import 'package:network_retrofit/src/models/cart_entity/cart_entity.dart';

import '../product/product_entity.dart';
part 'cart_Response_Entity.g.dart';

@JsonSerializable()
class CartResponseEntity
    implements BaseLayerDataTransformer<CartResponseEntity, Cart> {
  @JsonKey(name: 'data')
  CartEntity cartentity;
  CartResponseEntity(this.cartentity);
  @override
  CartResponseEntity restore(Cart data) {
    return CartResponseEntity(CartEntity(
        cartId: data.cartId,
        cartTotal: data.cartTotal,
        productCount: data.productCount,
        productlist: data.productlist
            .map((e) => ProductEntity(
                name: e.name,
                description: e.description,
                imageUrl: e.imageUrl,
                price: e.price,
                category: e.category,
                currencyId: e.currencyId,
                id: e.id))
            .toList()));
  }

  factory CartResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CartResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseEntityToJson(this);

  @override
  Cart transform() {
    return Cart(
        productlist: cartentity.productlist
            .map((e) => Product(
                name: e.name,
                description: e.description,
                imageUrl: e.imageUrl,
                price: e.price,
                category: e.category,
                currencyId: e.currencyId,
                id: e.id))
            .toList(),
        productCount: cartentity.productCount,
        cartTotal: cartentity.cartTotal,
        cartId: cartentity.cartId);
  }
}
