
import 'package:domain/domain.dart';
import 'package:domain/src/usecase/cart/add_to_cart_usecase.dart';
import 'package:domain/src/usecase/cart/remove_from_cart_usecase.dart';

import '../../data.dart';

class CartRepositoryImpl extends CartRepository {
  final NetworkPort networkPort;
  CartRepositoryImpl(this.networkPort);
  @override
  Future<Either<NetworkError, Cart>> addToCart (
      {required AddtoCartRequest addtoCartRequest}) async{

    return  await networkPort.addtoCart( addtoCartRequest: addtoCartRequest,);
  }
  @override
  Future<Either<NetworkError, Cart>> getCart({required GetCartItemsUseCaseParams getCartItemsUseCaseParams}) async{
    return await networkPort.getCart( userId: getCartItemsUseCaseParams.userId,);
  }

  @override
  Future<Either<NetworkError, Cart>> removeFromCart({required RemovefromCartRequest removefromCartRequest}) async {
    return await networkPort.removeFromCart(removefromCartRequest: removefromCartRequest);
  }
}