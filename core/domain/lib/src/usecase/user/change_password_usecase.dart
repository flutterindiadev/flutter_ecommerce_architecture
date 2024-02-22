import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class ChangePasswordUsecase
    extends BaseUseCase<BaseError, ChangePasswordUsecaseParams, bool> {
  UserRepository _userRepository;

  ChangePasswordUsecase(this._userRepository);

  @override
  Future<Either<BaseError, bool>> execute(
      {required ChangePasswordUsecaseParams params}) {
    return _userRepository.changePassword(
        changePasswordRequest: ChangePasswordRequest(
            userId: params.userId,
            password: params.newPassword,
            token: params.token));
  }
}

class ChangePasswordUsecaseParams extends Params {
  final int userId;
  final String newPassword;
  final String token;

  ChangePasswordUsecaseParams(
      {super.reloading,
      required this.userId,
      required this.newPassword,
      required this.token});

  @override
  Either<AppError, bool> verify() {
    if (Validator.isUserIdValid(userId)) {
      return Right(true);
    } else {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: ''),
          type: ErrorType.userIdNotFound));
    }
  }
}
