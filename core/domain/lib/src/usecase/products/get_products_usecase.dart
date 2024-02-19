import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetProducts
    extends BaseUseCase<BaseError, GetProductsParams, List<Product>> {
  final ProductRepository _productRepository;

  GetProducts(this._productRepository);

  @override
  Future<Either<BaseError, List<Product>>> execute(
      {required Params params}) async {


    var response = await _productRepository.getProducts();
    return response.fold((l) => Left(l), (r) => Right(r));
  }
}

class GetProductsParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
