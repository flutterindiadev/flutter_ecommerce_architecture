import 'package:data/data.dart';

import 'package:json_annotation/json_annotation.dart';

import '../product_entity.dart';



@JsonSerializable()
class CartEntity implements BaseLayerDataTransformer<CartEntity, Cart>{

  @JsonKey(name: 'productlist')
 final  List<ProductEntity> productlist;
  @JsonKey(name: 'productCount')
 final  int productCount ;
  @JsonKey(name: 'quantity')
final  int quantity;
  @JsonKey(name: 'cartTotal')
final  double cartTotal;

  CartEntity({required this.productlist,
    required  this.productCount,required this.quantity,
    required this.cartTotal});

  @override
  CartEntity restore(data) {
    final List<ProductEntity> prodEntity = List.generate(data.productCount, (index) =>
        ProductEntity(currencyId: data.productlist[index].currencyId,
            name: data.productlist[index].name, description: data.productlist[index].description,
            imageUrl: data.productlist[index].imageUrl,
            category: data.productlist[index].category, price: data.productlist[index].price));

    return CartEntity(productlist: prodEntity,
        productCount: data.productCount,
        quantity: data.quantity, cartTotal: data.cartTotal);
  }

  @override
  Cart transform() {
    final List<Product> prodlist=List.generate(productCount, (index) =>
        Product(name: productlist[index].name, description:  productlist[index].description,
            imageUrl:  productlist[index].imageUrl,
            price:  productlist[index].price,
            category:  productlist[index].category,
            currencyId:  productlist[index].currencyId));
    // TODO: implement transform
   return Cart(productlist: prodlist,
       productCount: productCount,
       quantity: quantity,
       cartTotal: cartTotal);
  }
}