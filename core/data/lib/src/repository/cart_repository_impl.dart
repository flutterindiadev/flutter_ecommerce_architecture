import 'package:domain/domain.dart';
import 'package:domain/src/usecase/cart/add_to_cart_usecase.dart';
import 'package:domain/src/usecase/cart/remove_from_cart_usecase.dart';

import '../../data.dart';

class CartRepositoryImpl extends CartRepository {
  final NetworkPort networkPort;
  CartRepositoryImpl(this.networkPort);
  @override
  Future<Either<NetworkError, Cart>> addToCart(
      {required AddtoCartRequest addtoCartRequest}) async {
    return await networkPort.addtoCart(
      addtoCartRequest: addtoCartRequest,
    );
  }

  @override
  Future<Either<NetworkError, Cart>> getCart(
      {required GetCartItemsUseCaseParams getCartItemsUseCaseParams}) async {
    return await networkPort.getCart(
      userId: getCartItemsUseCaseParams.userId,
    );
  }

  @override
  Future<Either<NetworkError, Cart>> removeFromCart(
      {required RemovefromCartRequest removefromCartRequest}) async {
    return await networkPort.removeFromCart(
        removefromCartRequest: removefromCartRequest);
  }

  @override
  Future<Either<NetworkError, OrderItem>> checkoutCart(
      {required CheckoutRequest checkoutRequest}) async {
    return await networkPort.checkoutCart(checkoutRequest: checkoutRequest);
  }

  @override
  Future<Either<NetworkError, ChangeCartAddress>> changeCartAddress(
      {required CartAddressChangeRequest cartAddressChangeRequest}) async {
    return await networkPort.changeCartAddress(
        cartAddressChangeRequest: cartAddressChangeRequest);
  }

  @override
  Future<Either<NetworkError, CartVoucher>> addVoucherInCart(
      {required CartVoucherAddRequest cartVoucherAddRequest}) async{
    return await networkPort.addVoucherinCart(cartVoucherAddRequest: cartVoucherAddRequest);
  }

  @override
  Future<Either<NetworkError, CartVoucherRemove>> removeVoucherfromCart({required CartVoucherRemoveRequest cartVoucherRemoveRequest}) {
    // TODO: implement removeVoucherfromCart
    throw UnimplementedError();
  }
}
