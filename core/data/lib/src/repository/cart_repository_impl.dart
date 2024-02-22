import 'package:domain/domain.dart';
import 'package:domain/src/usecase/cart/add_to_cart_usecase.dart';
import 'package:domain/src/usecase/cart/remove_from_cart_usecase.dart';

import '../../data.dart';

class CartRepositoryImpl extends CartRepository {
  final NetworkPort networkPort;
  CartRepositoryImpl(this.networkPort);
  @override
  Future<Either<NetworkError, bool>> addToCart(
      {required AddtoCartRequest addtoCartRequest}) {
    return networkPort.addtoCart(
      addtoCartRequest: addtoCartRequest,
    );
  }

  @override
  Future<Either<NetworkError, Cart>> getCart(
      {required GetCartItemsUseCaseParams getCartItemsUseCaseParams}) {
    return networkPort.getCart(
      userId: getCartItemsUseCaseParams.userId,
    );
  }

  @override
  Future<Either<NetworkError, Cart>> removeFromCart(
      {required RemovefromCartRequest removefromCartRequest}) {
    return networkPort.removeFromCart(
        removefromCartRequest: removefromCartRequest);
  }

  @override
  Future<Either<NetworkError, OrderItem>> checkoutCart(
      {required CheckoutRequest checkoutRequest}) {
    return networkPort.checkoutCart(checkoutRequest: checkoutRequest);
  }

  @override
  Future<Either<NetworkError, ChangeCartAddress>> changeCartAddress(
      {required CartAddressChangeRequest cartAddressChangeRequest}) {
    return networkPort.changeCartAddress(
        cartAddressChangeRequest: cartAddressChangeRequest);
  }

  @override
  Future<Either<NetworkError, CartVoucher>> addVoucherInCart(
      {required CartVoucherAddRequest cartVoucherAddRequest}) {
    return networkPort.addVoucherinCart(
        cartVoucherAddRequest: cartVoucherAddRequest);
  }

  @override
  Future<Either<NetworkError, CartVoucherRemove>> removeVoucherfromCart(
      {required CartVoucherRemoveRequest cartVoucherRemoveRequest}) {
    return networkPort.removeVoucherfromCart(
        cartVoucherRemoveRequest: cartVoucherRemoveRequest);
  }
}
