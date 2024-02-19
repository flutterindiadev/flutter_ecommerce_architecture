import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetCartItemsUseCase
    extends BaseUseCase<NetworkError, GetCartItemsUseCaseParams, Cart> {
  CartRepository cartRepository;
  GetCartItemsUseCase({required this.cartRepository});

  @override
  Future<Either<NetworkError, Cart>> execute(
      {required GetCartItemsUseCaseParams params}) {
    return cartRepository.getCart(getCartItemsUseCaseParams: params);
  }
}

class GetCartItemsUseCaseParams extends Params {
  int userId;
  GetCartItemsUseCaseParams({required this.userId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
