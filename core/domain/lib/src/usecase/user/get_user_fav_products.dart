import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetUserFavoriteProductsUsecase extends BaseUseCase<BaseError,
    GetUserFavoriteProductsUsecaseParams, List<Product>> {
  final UserRepository _userRepository;

  GetUserFavoriteProductsUsecase(this._userRepository);

  @override
  Future<Either<BaseError, List<Product>>> execute(
      {required GetUserFavoriteProductsUsecaseParams params}) {
    return _userRepository.getUserFavoriteProducts(userId: params.userId);
  }
}

class GetUserFavoriteProductsUsecaseParams extends Params {
  int userId;

  GetUserFavoriteProductsUsecaseParams(this.userId);
  @override
  Either<AppError, bool> verify() {
    if (userId == 0) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: 'UserId can\'t be 0'),
          type: ErrorType.userIdNotFound));
    } else {
      return Right(true);
    }
  }
}
