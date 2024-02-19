import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class SignUpUsecase extends BaseUseCase<BaseError, SignupParams, void> {
  final UserRepository _userRepository;

  SignUpUsecase(this._userRepository);

  @override
  Future<Either<BaseError, void>> execute(
      {required SignupParams params}) async {
    return Future.value(
      (await _userRepository.signUpWithEmail(
              SignUpRequest(email: params.email, password: params.password)))
          .fold((l) => Left(l), (result) async {
        return _userRepository.saveUser(result);
      }),
    );
  }
}

class SignupParams extends Params {
  final String email;
  final String password;

  SignupParams({required this.email, required this.password});

  @override
  Either<AppError, bool> verify() {
    if (Validator.isEmpty(email)) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: ''),
          type: ErrorType.uiEmptyEmail));
    } else if (Validator.validateEmail(email)) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: ''),
          type: ErrorType.uiInvalidEmail));
    } else if (Validator.isEmpty(password)) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: ''),
          type: ErrorType.uiEmptyPassword));
    } else {
      return Right(true);
    }
  }
}
