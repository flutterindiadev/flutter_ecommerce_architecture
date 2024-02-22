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
            isVoucherIdAvailable: params.isVoucherIsAvailable,
            cartId: params.cartId,
            voucherId: params.voucherId));
  }
}

class CartVoucherUseCaseParams extends Params {
  String cartId;
  String voucherId;
  final bool isVoucherIsAvailable;

  CartVoucherUseCaseParams({
    required this.cartId,
    required this.voucherId,
    required this.isVoucherIsAvailable,
  });

  @override
  Either<AppError, bool> verify() {
    if (Validator.isCartAvailable(this.isVoucherIsAvailable)) {
      return Left(
        AppError(
          type: ErrorType.voucherIsNotAvailable,
          throwable: Exception(),
          error: ErrorInfo(message: ' '),
        ),
      );
    } else
      return Right(true);
  }
}
