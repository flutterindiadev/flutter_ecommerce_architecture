import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class VerifyOTPUsecase extends BaseUseCase<BaseError, VerifyotpParams, bool> {
  final UserRepository _userRepository;

  VerifyOTPUsecase(this._userRepository);

  @override
  Future<Either<BaseError, bool>> execute({required params}) {
    return _userRepository.verifyotp(params.otp);
  }
}

class VerifyotpParams extends Params {
  int otp;

  VerifyotpParams(this.otp);

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
