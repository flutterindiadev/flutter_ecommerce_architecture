import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetUserProfileUsecase
    extends BaseUseCase<BaseError, GetUserProfileUsecaseParams, UserProfile> {
  UserRepository _userRepository;

  GetUserProfileUsecase(this._userRepository);

  @override
  Future<Either<BaseError, UserProfile>> execute(
      {required GetUserProfileUsecaseParams params}) {
    return _userRepository.getUserProfile(userId: params.userId);
  }
}

class GetUserProfileUsecaseParams extends Params {
  int userId;

  GetUserProfileUsecaseParams(this.userId);
  @override
  Either<AppError, bool> verify() {
    if (userId == 0) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: ''),
          type: ErrorType.userIdNotFound));
    } else {
      return Right(true);
    }
  }
}
