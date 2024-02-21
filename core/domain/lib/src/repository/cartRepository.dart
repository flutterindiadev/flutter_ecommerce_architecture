import 'package:domain/src/usecase/cart/add_to_cart_usecase.dart';

import '../../domain.dart';
import '../usecase/cart/remove_from_cart_usecase.dart';

abstract class CartRepository {
  Future<Either<NetworkError, bool>> addToCart(
      {required AddtoCartRequest addtoCartRequest});
  Future<Either<NetworkError, Cart>> getCart(
      {required GetCartItemsUseCaseParams getCartItemsUseCaseParams});
  Future<Either<NetworkError, Cart>> removeFromCart(
      {required RemovefromCartRequest removefromCartRequest});
  Future<Either<NetworkError, OrderItem>> checkoutCart(
      {required CheckoutRequest checkoutRequest});

  Future<Either<NetworkError, ChangeCartAddress>> changeCartAddress(
      {required CartAddressChangeRequest cartAddressChangeRequest});
  Future<Either<NetworkError, CartVoucher>> addVoucherInCart(
      {required CartVoucherAddRequest cartVoucherAddRequest});
  Future<Either<NetworkError, CartVoucherRemove>> removeVoucherfromCart(
      {required CartVoucherRemoveRequest cartVoucherRemoveRequest});
}
