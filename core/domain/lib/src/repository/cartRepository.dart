import 'package:domain/src/usecase/cart/add_to_cart_usecase.dart';

import '../../domain.dart';
import '../usecase/cart/remove_from_cart_usecase.dart';

abstract class CartRepository {
  Future<Either<NetworkError, Cart>> addToCart(AddtoCartRequest addtoCartRequest);

  Future<Either<NetworkError,Cart>> getCart(GetCartItemsUseCaseParams params);
  Future<Either<NetworkError,Cart>> removeFromCart(RemovefromCartRequest removefromCartRequest);
}