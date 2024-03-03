import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class UserSettingsUsecase
    extends BaseUseCase<BaseError, UserSettingsUsecaseParams, UserSettings> {
  final UserRepository _userRepository;

  UserSettingsUsecase(this._userRepository);

  @override
  Future<Either<BaseError, UserSettings>> execute(
      {required UserSettingsUsecaseParams params}) {
    return _userRepository.getUserSettings(userId: params.userId);
  }
}

class UserSettingsUsecaseParams extends Params {
  int userId;

  UserSettingsUsecaseParams(this.userId);

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
