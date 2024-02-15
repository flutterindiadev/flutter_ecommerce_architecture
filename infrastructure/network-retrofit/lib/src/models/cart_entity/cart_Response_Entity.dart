
import 'package:json_annotation/json_annotation.dart';
import 'package:data/data.dart';
import 'package:network_retrofit/src/models/product_entity.dart';
import 'package:network_retrofit/src/models/cart_entity/cart_entity.dart';
part 'cart_Response_Entity.g.dart';

@JsonSerializable()
class CartResponseEntity
    implements BaseLayerDataTransformer<CartResponseEntity, Cart> {
  CartEntity cartentity;
  CartResponseEntity(this.cartentity);
  @override
  CartResponseEntity restore(Cart data) {
    return CartResponseEntity(CartEntity(productlist: List.generate(
      data.productCount,
          (index) =>ProductEntity(name: data.productlist[index].name, description: data.productlist[index].description,
              imageUrl: data.productlist[index].imageUrl, price: data.productlist[index].price,
              category: data.productlist[index].category, currencyId: data.productlist[index].currencyId),),
        productCount: data.productCount, cartTotal: data.cartTotal, cartId: data.cartId,));
  }

  @override
  Cart transform() {
    return Cart(productlist: List.generate(
        cartentity.productCount, (index) => Product(
        name: cartentity.productlist[index].name, description: cartentity.productlist[index].description,
        imageUrl: cartentity.productlist[index].imageUrl,
        price: cartentity.productlist[index].price, category: cartentity.productlist[index].category,
        currencyId: cartentity.productlist[index].currencyId)),
        productCount: cartentity.productCount,
        cartTotal: cartentity.cartTotal, cartId: cartentity.cartId);
  }
}