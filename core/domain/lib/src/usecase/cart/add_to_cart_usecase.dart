

import '../../../domain.dart';
import '../../repository/cartRepository.dart';
import '../base/base_usecase.dart';

class AddToCartUseCase
    extends BaseUseCase<NetworkError,CartProductAddUseCaseParams,void> {
  final CartRepository cartRepository;
  AddtoCartRequest addtoCartRequest;

  AddToCartUseCase(this.cartRepository,this.addtoCartRequest);

  @override
  Future<Either<NetworkError, void>> execute({required CartProductAddUseCaseParams  params}) {
    return  cartRepository.addToCart(params.addtoCartRequest);
    
  }
}

class CartProductAddUseCaseParams extends Params{
  AddtoCartRequest addtoCartRequest;

  CartProductAddUseCaseParams({required this.addtoCartRequest});

  @override
  Either<AppError, bool> verify() {
    // TODO: implement verify
    throw UnimplementedError();
  }

  // @override
  // Future<Either<AppError, bool>> verify() async {
  //   //TODO: verify fo error
  //   //   if(cart.productCount == 0){
  //   //     return Left(AppError(throwable: Exception(), error: ErrorInfo(message: "Your Bag is Light",
  //   //         code: 404), type: ErrorType.cartIsEmpty));
  //   //   }
  //   //   else
  //   //     return Right(true);
  //   // }
  // }
}