import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class ForgotPasswordUsecase extends BaseUseCase {
  final UserRepository _userRepository;

  ForgotPasswordUsecase(this._userRepository);

  @override
  Future<Either<BaseError, dynamic>> execute({required Params params}) async {
    return await _userRepository.forgotPassword();
  }
}
