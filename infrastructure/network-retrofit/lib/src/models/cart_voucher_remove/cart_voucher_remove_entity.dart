import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart_voucher_remove_entity.g.dart';

@JsonSerializable()
class CartVoucherRemoveEntity
    implements
        BaseLayerDataTransformer<CartVoucherRemoveEntity, CartVoucherRemove> {
  @JsonKey(name: 'status')
  bool status;

  CartVoucherRemoveEntity({required this.status});

  factory CartVoucherRemoveEntity.fromJson(Map<String, dynamic> json) =>
      _$CartVoucherRemoveEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CartVoucherRemoveEntityToJson(this);

  @override
  CartVoucherRemoveEntity restore(CartVoucherRemove data) {
    return CartVoucherRemoveEntity(status: status);
  }

  @override
  CartVoucherRemove transform() {
    return CartVoucherRemove(status: status);
  }
}
