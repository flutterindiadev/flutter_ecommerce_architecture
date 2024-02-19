import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

/*Calling forgot password with trigger OTP send to user registered mobile number 
Further proceed to otp verification
*/

class ForgotPasswordUsecase
    extends BaseUseCase<BaseError, ForgotPasswordUsecaseParams, void> {
  final UserRepository _userRepository;

  ForgotPasswordUsecase(this._userRepository);

  @override
  Future<Either<BaseError, void>> execute({required Params params}) async {
    return await _userRepository.forgotPassword();
  }
}

class ForgotPasswordUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
