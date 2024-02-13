import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetCartItemsUseCase extends BaseUseCase<NetworkError,GetCartItemsUseCaseParams ,Cart>{
   CartRepository cartRepository;


   GetCartItemsUseCase(this.cartRepository);

   @override
  Future<Either<NetworkError, Cart>> execute({required GetCartItemsUseCaseParams params})async {
   return await cartRepository.getCart(params);
  }
  
}

class GetCartItemsUseCaseParams extends Params {
  int userId;


  GetCartItemsUseCaseParams(this.userId);

  @override
  Either<AppError, bool> verify() {
    // TODO: implement verify
    throw UnimplementedError();
  }







}