
import 'package:domain/domain.dart';
import 'package:domain/src/usecase/cart/add_to_cart_usecase.dart';

import '../../data.dart';

class CartRepositoryImpl extends CartRepository {
  final NetworkPort networkPort;

  CartRepositoryImpl(this.networkPort);

  @override
  Future<Either<NetworkError, Cart>> addToCart (AddtoCartRequest addtoCartRequest) async{

    return  await networkPort.addtoCart(addtoCartRequest);
  }

  @override
  Future<Either<NetworkError, Cart>> getCart(GetCartItemsUseCaseParams params) async{
   return await networkPort.getCart(params.userId);
  }



}