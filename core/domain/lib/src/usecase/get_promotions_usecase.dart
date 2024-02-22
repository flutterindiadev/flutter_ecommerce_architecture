import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetPromotionsUsecase extends BaseUseCase<BaseError,
    GetPromotionsUsecaseParams, List<Promotion>> {
  ProductRepository _productRepository;

  GetPromotionsUsecase(this._productRepository);

  @override
  Future<Either<BaseError, List<Promotion>>> execute(
      {required GetPromotionsUsecaseParams params}) {
    return _productRepository.getPromotions();
  }
}

class GetPromotionsUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
