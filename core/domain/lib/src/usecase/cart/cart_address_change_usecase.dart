import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class CartAddressChangeUseCase extends BaseUseCase<NetworkError,
    CartAddressChangeUseCaseParams, ChangeCartAddress> {
  final CartRepository cartRepository;

  CartAddressChangeUseCase({required this.cartRepository});

  @override
  Future<Either<NetworkError, ChangeCartAddress>> execute(
      {required CartAddressChangeUseCaseParams params}) {
    return cartRepository.changeCartAddress(
        cartAddressChangeRequest:
            CartAddressChangeRequest(addressId: params.addressId));
  }
}

class CartAddressChangeUseCaseParams extends Params {
  String addressId;
  CartAddressChangeUseCaseParams(
    this.addressId,
  );

  @override
  Either<AppError, bool> verify() {
    if (Validator.isEmpty(addressId)) {
      return Left(
        AppError(
            throwable: Exception(),
            error: ErrorInfo(message: ''),
            type: ErrorType.addressIsEmpty),
      );
    } else {
      return right(true);
    }
  }
}
