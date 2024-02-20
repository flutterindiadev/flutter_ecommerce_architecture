import '../../../domain.dart';
import '../base/base_usecase.dart';

class AddToCartUseCase
    extends BaseUseCase<NetworkError, CartProductAddUseCaseParams, void> {
  final CartRepository cartRepository;
  AddtoCartRequest addtoCartRequest;

  AddToCartUseCase(
      {required this.cartRepository, required this.addtoCartRequest});

  @override
  Future<Either<NetworkError, void>> execute(
      {required CartProductAddUseCaseParams params}) {
    return cartRepository.addToCart(addtoCartRequest: params.addtoCartRequest);
  }
}

class CartProductAddUseCaseParams extends Params {
  AddtoCartRequest addtoCartRequest;

  CartProductAddUseCaseParams({required this.addtoCartRequest});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
