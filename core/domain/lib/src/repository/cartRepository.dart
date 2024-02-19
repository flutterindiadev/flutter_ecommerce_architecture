import 'package:domain/src/usecase/cart/add_to_cart_usecase.dart';

import '../../domain.dart';
import '../usecase/cart/remove_from_cart_usecase.dart';

abstract class CartRepository {
  Future<Either<NetworkError, Cart>> addToCart(
      {required AddtoCartRequest addtoCartRequest});
  Future<Either<NetworkError, Cart>> getCart(
      {required GetCartItemsUseCaseParams getCartItemsUseCaseParams});
  Future<Either<NetworkError, Cart>> removeFromCart(
      {required RemovefromCartRequest removefromCartRequest});
  Future<Either<NetworkError, OrderItem>> checkout(
      {required CheckoutRequest checkoutRequest});
}
