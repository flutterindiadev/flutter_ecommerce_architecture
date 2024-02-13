

import '../../../domain.dart';
import '../../repository/cartRepository.dart';
import '../base/base_usecase.dart';

class AddToCartUseCase
    extends BaseUseCase<NetworkError,CartProductAddUseCaseParams,Cart> {
  final CartRepository cartRepository;

  AddToCartUseCase(this.cartRepository);

  @override
  Future<Either<NetworkError, Cart>> execute({required  params}) {
    return  cartRepository.addToCart(params);
    
  }
}

class CartProductAddUseCaseParams extends Params{
  Cart cart;

  CartProductAddUseCaseParams({required this.cart});

  @override
  Either<AppError, bool> verify() {
    if(cart.productCount == 0){
      return Left(AppError(throwable: Exception(), error: ErrorInfo(message: "Your Bag is Light",
          code: 404), type: ErrorType.cartIsEmpty));
    }
    else
      return Right(true);
  }
}