import '../../../domain.dart';
import '../base/base_usecase.dart';

class CartVoucherAddUseCase
    extends BaseUseCase<NetworkError, CartVoucherUseCaseParams, CartVoucher> {
  CartRepository cartRepository;

  CartVoucherAddUseCase({required this.cartRepository});

  @override
  Future<Either<NetworkError, CartVoucher>> execute(
      {required CartVoucherUseCaseParams params}) {
    return cartRepository.addVoucherInCart(cartVoucherAddRequest:
    CartVoucherAddRequest(isVoucherIdAvailable: params.isVoucherIdAvailable, cartId: params.cartId,
        voucherId: params.voucherId));
  }
}

class CartVoucherUseCaseParams extends Params {
  String cartId;
  String voucherId;
  final bool isVoucherIdAvailable;

  CartVoucherUseCaseParams({required this.cartId, 
    required this.voucherId,required this.isVoucherIdAvailable, });

  @override
  Either<AppError, bool> verify() {
    if (Validator.isCartAvailable(this.isVoucherIdAvailable)) {
      return Left(
        AppError(
          type: ErrorType.uiEmptyEmail,
          throwable: Exception(),
          error: ErrorInfo(message: "voucher is used already"),
        ),
      );
    }
    else return Right(true);
  }
}
