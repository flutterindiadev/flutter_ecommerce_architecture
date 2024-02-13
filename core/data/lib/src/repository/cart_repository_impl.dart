
import 'package:domain/domain.dart';
import 'package:domain/src/usecase/cart/add_to_cart_usecase.dart';

import '../../data.dart';

class CartRepositoryImpl extends CartRepository {
  final NetworkPort networkPort;

  CartRepositoryImpl(this.networkPort);

  @override
  Future<Either<NetworkError, Cart>> addToCart (CartProductAddUseCaseParams params) async{

    return  await networkPort.addtoCart();
  }

  @override
  Future<Either<NetworkError, Cart>> getCart() async{
   return await networkPort.getCartList();
  }



}