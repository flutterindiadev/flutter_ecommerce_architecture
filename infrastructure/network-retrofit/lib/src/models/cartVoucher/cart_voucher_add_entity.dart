import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart_voucher_add_entity.g.dart';

@JsonSerializable()
class CartVoucherEntity
    implements BaseLayerDataTransformer<CartVoucherEntity, CartVoucher> {
  @JsonKey(name: 'voucherdiscount')
  double voucherdiscount;

  @JsonKey(name: 'cartTotal')
  double cartTotal;

  @JsonKey(name: 'cartValueAfterDiscount')
  double cartValueAfterDiscount;

  CartVoucherEntity(
      {required this.voucherdiscount,
      required this.cartTotal,
      required this.cartValueAfterDiscount});

  factory CartVoucherEntity.fromJson(Map<String, dynamic> json) =>
      _$CartVoucherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CartVoucherEntityToJson(this);

  @override
  CartVoucherEntity restore(CartVoucher data) {
    return CartVoucherEntity(
        voucherdiscount: voucherdiscount,
        cartTotal: cartTotal,
        cartValueAfterDiscount: cartValueAfterDiscount);
  }

  @override
  CartVoucher transform() {
    return CartVoucher(
        voucherdiscount: voucherdiscount,
        cartTotal: cartTotal,
        cartValueAfterDiscount: cartValueAfterDiscount);
  }
}
