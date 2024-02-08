import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetProducts extends BaseUseCase {
  final ProductRepository _productRepository;

  GetProducts(this._productRepository);

  @override
  Future<Either<BaseError, List<Product>>> execute(
      {required Params params}) async {
    return Future.value((await _productRepository.getProducts())
        .fold((l) => Left(l), (result) async {
      await _productRepository.saveProducts(result);
      return Right(result);
    }));
  }
}
