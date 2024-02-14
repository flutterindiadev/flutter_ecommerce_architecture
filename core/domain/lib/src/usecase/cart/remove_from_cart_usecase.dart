import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class CartProductRemoveUseCase
    extends BaseUseCase<NetworkError, CartProductRemoveUseCaseParams,Cart> {
  final CartRepository cartRepository;

  CartProductRemoveUseCase(this.cartRepository);

  @override
  Future<Either<NetworkError,Cart>> execute({required CartProductRemoveUseCaseParams params}) async{
    return await cartRepository.removeFromCart(params.removeFromCartRequest);

  }
}




class CartProductRemoveUseCaseParams extends Params {
 RemovefromCartRequest removeFromCartRequest;

  CartProductRemoveUseCaseParams(this.removeFromCartRequest);

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}