import '../../../domain.dart';
import '../base/base_usecase.dart';

class LogoutUseCase
    extends BaseUseCase<BaseError, LogoutUseCaseParams, Logout> {
  final UserRepository userRepository;

  LogoutUseCase({required this.userRepository});

  @override
  Future<Either<BaseError, Logout>> execute({required LogoutUseCaseParams params}) {
    return userRepository.logout(params.logoutRequest);
  }
}
class LogoutUseCaseParams extends Params{
  LogoutRequest logoutRequest;

  LogoutUseCaseParams(this.logoutRequest);

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}