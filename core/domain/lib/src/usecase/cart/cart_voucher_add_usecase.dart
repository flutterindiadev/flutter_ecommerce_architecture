import '../../../domain.dart';
import '../base/base_usecase.dart';

class CartVoucherAddUseCase
    extends BaseUseCase<NetworkError, CartVoucherUseCaseParams, CartVoucher> {
  CartRepository cartRepository;

  CartVoucherAddUseCase({required this.cartRepository});

  @override
  Future<Either<NetworkError, CartVoucher>> execute(
      {required CartVoucherUseCaseParams params}) {
    return cartRepository.addVoucherInCart(
        cartVoucherAddRequest: CartVoucherAddRequest(
            cartId: params.cartId,
            voucherId: params.voucherId));
  }
}

class CartVoucherUseCaseParams extends Params {
  String cartId;
  String voucherId;


  CartVoucherUseCaseParams({
    required this.cartId,
    required this.voucherId,

  });

  @override
  Either<AppError, bool> verify() {
   return Right(true);
  }
}
