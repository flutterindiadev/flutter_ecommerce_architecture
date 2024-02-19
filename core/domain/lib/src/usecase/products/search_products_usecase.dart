// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class SearchProductsUsecase
    extends BaseUseCase<BaseError, SearchProductsUsecaseParams, List<Product>> {
  ProductRepository _productRepository;

  SearchProductsUsecase(this._productRepository);

  @override
  Future<Either<BaseError, List<Product>>> execute(
      {required SearchProductsUsecaseParams params}) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}

class SearchProductsUsecaseParams extends Params {
  String productName;
  SearchProductsUsecaseParams({
    required this.productName,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
