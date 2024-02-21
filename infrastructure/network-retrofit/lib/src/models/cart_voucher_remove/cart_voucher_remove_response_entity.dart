import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cart_voucher_remove_entity.dart';
part 'cart_voucher_remove_response_entity.g.dart';

@JsonSerializable()
class CartVoucherRemoveResponseEntity
    implements
        BaseLayerDataTransformer<CartVoucherRemoveEntity, CartVoucherRemove> {
  @JsonKey(name: 'data')
  final CartVoucherRemoveEntity cartVoucherRemoveEntity;

  CartVoucherRemoveResponseEntity({required this.cartVoucherRemoveEntity});

  factory CartVoucherRemoveResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CartVoucherRemoveResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CartVoucherRemoveResponseEntityToJson(this);
  @override
  CartVoucherRemoveEntity restore(CartVoucherRemove data) {
    return CartVoucherRemoveEntity(status: data.status);
  }

  @override
  CartVoucherRemove transform() {
    return CartVoucherRemove(status: cartVoucherRemoveEntity.status);
  }
}
