import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class CheckoutUseCase
    extends BaseUseCase<NetworkError, CheckoutUseCaseParams, OrderItem> {
  CartRepository cartRepository;

  CheckoutUseCase({required this.cartRepository});

  @override
  Future<Either<NetworkError, OrderItem>> execute(
      {required CheckoutUseCaseParams params}) {
    return cartRepository.checkoutCart(checkoutRequest: params.checkoutRequest);
  }
}

class CheckoutUseCaseParams extends Params {
  CheckoutRequest checkoutRequest;

  CheckoutUseCaseParams(this.checkoutRequest);

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
