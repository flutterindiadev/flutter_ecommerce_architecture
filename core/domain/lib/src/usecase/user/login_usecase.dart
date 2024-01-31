import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

import '../../repository/user_repository.dart';
import '../base/base_usecase.dart';
import '../base/params.dart';

class LoginUseCase extends BaseUseCase<BaseError, LoginUseCaseParams, void> {
  final UserRepository _userRepository;

  LoginUseCase(
    this._userRepository,
  );

  @override
  Future<Either<BaseError, void>> execute(
      {required LoginUseCaseParams params}) async {
    return Future.value(
      (await _userRepository.loginWithEmail(params.loginRequest))
          .fold((l) => Left(l), (result) async {
        return _userRepository.saveUser(result);
      }),
    );
  }
}

class LoginUseCaseParams extends Params {
  final LoginRequest loginRequest;

  LoginUseCaseParams({
    required this.loginRequest,
  });

  @override
  Either<AppError, bool> verify() {
    if (Validator.isEmpty(loginRequest.emailOrPhone)) {
      return Left(
        AppError(
          type: ErrorType.uiEmptyEmail,
          throwable: Exception(),
          error: ErrorInfo(message: ''),
        ),
      );
    } else if (!Validator.validateEmail(loginRequest.emailOrPhone)) {
      return Left(
        AppError(
          type: ErrorType.uiInvalidEmail,
          throwable: Exception(),
          error: ErrorInfo(message: ''),
        ),
      );
    } else if (Validator.isEmpty(loginRequest.password)) {
      return Left(
        AppError(
          type: ErrorType.uiEmptyPassword,
          throwable: Exception(),
          error: ErrorInfo(message: ''),
        ),
      );
    } else {
      return Right(true);
    }
  }
}
