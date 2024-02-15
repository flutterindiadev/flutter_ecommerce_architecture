import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class CartProductRemoveUseCase
    extends BaseUseCase<NetworkError, CartProductRemoveUseCaseParams,Cart> {
  final CartRepository cartRepository;
  CartProductRemoveUseCase({required this.cartRepository});

  @override
  Future<Either<NetworkError,Cart>> execute({required CartProductRemoveUseCaseParams params}){
    return cartRepository.removeFromCart(removefromCartRequest :params.removeFromCartRequest);
  }
}
class CartProductRemoveUseCaseParams extends Params {
 RemovefromCartRequest removeFromCartRequest;
 CartProductRemoveUseCaseParams({required this.removeFromCartRequest});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}