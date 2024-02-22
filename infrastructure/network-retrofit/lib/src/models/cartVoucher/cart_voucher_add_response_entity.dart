import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/cartVoucher/cart_voucher_add_entity.dart';
part 'cart_voucher_add_response_entity.g.dart';

@JsonSerializable()
class CartVoucherResponseEntity
    implements
        BaseLayerDataTransformer<CartVoucherResponseEntity, CartVoucher> {
  @JsonKey(name: 'data')
  CartVoucherEntity cartVoucherEntity;

  CartVoucherResponseEntity(this.cartVoucherEntity);

  factory CartVoucherResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CartVoucherResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CartVoucherResponseEntityToJson(this);

  @override
  CartVoucher transform() {
    return CartVoucher(
        voucherdiscount: cartVoucherEntity.voucherdiscount,
        cartTotal: cartVoucherEntity.cartTotal,
        cartValueAfterDiscount: cartVoucherEntity.cartValueAfterDiscount);
  }

  @override
  CartVoucherResponseEntity restore(CartVoucher data) {
    return CartVoucherResponseEntity(CartVoucherEntity(
        voucherdiscount: data.voucherdiscount,
        cartTotal: data.cartTotal,
        cartValueAfterDiscount: data.cartValueAfterDiscount));
  }
}
