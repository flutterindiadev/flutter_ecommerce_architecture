import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetNotificationPermisionUsecase extends BaseUseCase<BaseError,
    GetNotificationPermisionUsecaseParams, AppPermission> {
  PermissionRepository permissionRepository;

  GetNotificationPermisionUsecase(this.permissionRepository);

  @override
  Future<Either<BaseError, AppPermission>> execute(
      {required GetNotificationPermisionUsecaseParams params}) {
    return permissionRepository.getNotificationPermission();
  }
}

class GetNotificationPermisionUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
