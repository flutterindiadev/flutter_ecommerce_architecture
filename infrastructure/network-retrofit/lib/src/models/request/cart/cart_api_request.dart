import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../product_entity.dart';
@JsonSerializable()
class AddtoCartApiRequest
    implements BaseLayerDataTransformer<AddtoCartApiRequest, AddtoCartRequest> {
  @JsonKey(name: 'cartId')
  String cartId;
  @JsonKey(name: 'product')
  ProductEntity productEntity;
  AddtoCartApiRequest( {required this.productEntity,required this.cartId});

  @override
  AddtoCartApiRequest restore(AddtoCartRequest data) {

    return AddtoCartApiRequest(productEntity:productEntity, cartId: data.cartId);
  }

  @override
  AddtoCartRequest transform() {
    final product = productEntity.transform();
    return AddtoCartRequest(product: product , cartId: cartId);
  }
}

