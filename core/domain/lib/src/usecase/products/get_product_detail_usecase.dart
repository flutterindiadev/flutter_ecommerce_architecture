import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetProductDetailUsecase
    extends BaseUseCase<BaseError, GetProductDetailUsecaseParams, Product> {
  final ProductRepository _productRepository;

  GetProductDetailUsecase(this._productRepository);

  @override
  Future<Either<BaseError, Product>> execute(
      {required GetProductDetailUsecaseParams params}) async {
    var response = await _productRepository.getProductDetail(params.productId);

    return response.fold((l) => Left(l), (r) => Right(r));
  }
}

class GetProductDetailUsecaseParams extends Params {
  int productId;

  GetProductDetailUsecaseParams(this.productId);
  @override
  Either<AppError, bool> verify() {
    // TODO: implement verify
    throw UnimplementedError();
  }
}
