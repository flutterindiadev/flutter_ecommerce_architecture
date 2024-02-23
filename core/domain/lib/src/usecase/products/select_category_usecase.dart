import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class SelectCategoryUsecase
    extends BaseUseCase<BaseError, SelectCategoryUsecaseParams, List<Product>> {
  ProductRepository _productRepository;

  SelectCategoryUsecase(this._productRepository);

  @override
  Future<Either<BaseError, List<Product>>> execute(
      {required SelectCategoryUsecaseParams params}) {
    return _productRepository.selectCategory(params.category);
  }
}

class SelectCategoryUsecaseParams extends Params {
  String category;

  SelectCategoryUsecaseParams(this.category);

  @override
  Either<AppError, bool> verify() {
    if (category.isNotEmpty) {
      return Left(AppError(
        error: ErrorInfo(
          message: '',
        ),
        throwable: Exception(),
        type: ErrorType.blankCategory,
      ));
    } else {
      return Right(true);
    }
  }
}
