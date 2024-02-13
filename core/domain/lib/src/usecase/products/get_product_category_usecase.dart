import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/product_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetProductCategoryUsecase extends BaseUseCase<BaseError,
    GetProductCategoryUsecaseParams, List<ProductCategory>> {
  final ProductRepository _productRepository;

  GetProductCategoryUsecase(this._productRepository);
  @override
  Future<Either<BaseError, List<ProductCategory>>> execute(
      {required Params params}) async {
    var response = await _productRepository.getProductCategory();
    return response.fold((l) => Left(l), (r) => Right(r));
  }
}

class GetProductCategoryUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    // TODO: implement verify
    throw UnimplementedError();
  }
}
