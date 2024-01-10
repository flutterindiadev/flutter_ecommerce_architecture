import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class SignUpUsecase extends BaseUseCase<BaseError, SignupParams, User> {
  final UserRepository _userRepository;

  SignUpUsecase(this._userRepository);

  @override
  Future<Either<BaseError, User>> execute(
      {required SignupParams params}) async {
    return Future.value(
      (await _userRepository.signUpWithEmail(params.signUpRequest))
          .fold((l) => Left(l), (result) async {
        return _userRepository.saveUser(result);
      }),
    );
  }
}

class SignupParams extends Params {
  final SignUpRequest signUpRequest;

  SignupParams(this.signUpRequest);

  @override
  Either<AppError, bool> verify() {
    if (Validator.isEmpty(signUpRequest.email)) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: ''),
          type: ErrorType.uiEmptyEmail));
    } else if (Validator.validateEmail(signUpRequest.email)) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: ''),
          type: ErrorType.uiInvalidEmail));
    } else if (Validator.isEmpty(signUpRequest.password)) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: ''),
          type: ErrorType.uiEmptyPassword));
    } else {
      return Right(true);
    }
  }
}
