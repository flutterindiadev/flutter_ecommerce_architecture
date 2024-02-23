import 'package:domain/domain.dart';

import '../../data.dart';

class CartRepositoryImpl extends CartRepository {
  final NetworkPort networkPort;
  CartRepositoryImpl(this.networkPort);
  @override
  Future<Either<NetworkError, Cart>> addToCart(
      {required AddtoCartRequest addtoCartRequest}) async {
    return networkPort.addtoCart(
      addtoCartRequest: addtoCartRequest,
    );
  }

  @override
  Future<Either<NetworkError, Cart>> getCart(
      {required GetCartItemsUseCaseParams getCartItemsUseCaseParams}) async {
    return networkPort.getCart(
      userId: getCartItemsUseCaseParams.userId,
    );
  }

  @override
  Future<Either<NetworkError, Cart>> removeFromCart(
      {required RemovefromCartRequest removefromCartRequest}) async {
    return networkPort.removeFromCart(
        removefromCartRequest: removefromCartRequest);
  }

  @override
  Future<Either<NetworkError, OrderItem>> checkout(
      {required CheckoutRequest checkoutRequest}) async {
    return networkPort.checkout(checkoutRequest: checkoutRequest);
  }
}
