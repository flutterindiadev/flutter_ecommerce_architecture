import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class CheckoutApiRequest implements BaseLayerDataTransformer<CheckoutApiRequest, CheckoutRequest>{
  @JsonKey(name: 'cartId')
  String cartId;
  @JsonKey(name: 'userId')
  String userId;
  CheckoutApiRequest({required this.cartId, required this.userId});

  @override
  CheckoutApiRequest restore(CheckoutRequest data) {
    return CheckoutApiRequest(cartId: cartId, userId: userId);
  }

  @override
  CheckoutRequest transform() {
    // TODO: implement transform
    throw UnimplementedError();
  }

}