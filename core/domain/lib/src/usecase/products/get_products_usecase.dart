import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetProducts extends BaseUseCase {
  final ProductRepository _productRepository;

  GetProducts(this._productRepository);

  @override
  Future<Either<BaseError, List<Product>>> execute(
      {required Params params}) async {
    return  _productRepository.getProducts()
    ;
  }
}
