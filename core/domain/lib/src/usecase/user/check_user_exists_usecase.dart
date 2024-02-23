// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain/src/usecase/base/base_usecase.dart';

import '../../../domain.dart';

class CheckUserExists
    extends BaseUseCase<BaseError, CheckUserExistsParams, bool> {
  final UserRepository _userRepository;

  CheckUserExists(this._userRepository);

  @override
  Future<Either<BaseError, bool>> execute(
      {required CheckUserExistsParams params}) {
    return _userRepository.userExists(email: params.email);
  }
}

class CheckUserExistsParams extends Params {
  String email;
  CheckUserExistsParams({
    required this.email,
  });
  @override
  Either<AppError, bool> verify() {
    if (Validator.validateEmail(email)) {
      return Right(true);
    } else {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: ''),
          type: ErrorType.uiInvalidEmail));
    }
  }
}
