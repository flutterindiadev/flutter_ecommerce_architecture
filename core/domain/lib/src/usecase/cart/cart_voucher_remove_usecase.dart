import 'package:domain/domain.dart';

import '../base/base_usecase.dart';


class CartVoucherRemoveUseCase
    extends BaseUseCase<NetworkError, CartVoucherRemoveUseCaseParams,CartVoucherRemove> {
  final CartRepository cartRepository;
  CartVoucherRemoveUseCase(this.cartRepository);


  @override
  Future<Either<NetworkError, CartVoucherRemove>> execute({required CartVoucherRemoveUseCaseParams params}) {
    return cartRepository.removeVoucherfromCart(cartVoucherRemoveRequest:
    CartVoucherRemoveRequest(cartId: params.cartId));
  }
}
class CartVoucherRemoveUseCaseParams extends Params{
  final String cartId;
  CartVoucherRemoveUseCaseParams({required this.cartId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}