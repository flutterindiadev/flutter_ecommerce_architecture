import 'package:data/data.dart';

import 'package:json_annotation/json_annotation.dart';

import '../product/product_entity.dart';
part 'cart_entity.g.dart';

@JsonSerializable()
class CartEntity implements BaseLayerDataTransformer<CartEntity, Cart> {

  @JsonKey(name: 'cartId')
  final String cartId;
  @JsonKey(name: 'productlist')
  final List<ProductEntity> productlist;
  @JsonKey(name: 'productCount')
  final int productCount;
  @JsonKey(name: 'cartTotal')
  final double cartTotal;

  CartEntity(
      {required this.cartId,
      required this.productlist,
      required this.productCount,
      required this.cartTotal});

  @override
  CartEntity restore(data) {
    final List<ProductEntity> prodEntity = List.generate(
        data.productCount,
        (index) => ProductEntity(
            currencyId: data.productlist[index].currencyId,
            name: data.productlist[index].name,
            description: data.productlist[index].description,
            imageUrl: data.productlist[index].imageUrl,
            category: data.productlist[index].category,
            price: data.productlist[index].price,
            id: data.productlist[index].id));

    return CartEntity(
      productlist: prodEntity,
      productCount: data.productCount,
      cartTotal: data.cartTotal,
      cartId: data.cartId,
    );
  }
  factory CartEntity.fromJson(Map<String, dynamic> json) =>
      _$CartEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CartEntityToJson(this);

  @override
  Cart transform() {
    final List<Product> prodlist = List.generate(
        productCount,
        (index) => Product(
              name: productlist[index].name,
              description: productlist[index].description,
              imageUrl: productlist[index].imageUrl,
              price: productlist[index].price,
              category: productlist[index].category,
              currencyId: productlist[index].currencyId,
              id: productlist[index].id,
            ));

    return Cart(
        productlist: prodlist,
        productCount: productCount,
        cartTotal: cartTotal,
        cartId: cartId);
  }
}
