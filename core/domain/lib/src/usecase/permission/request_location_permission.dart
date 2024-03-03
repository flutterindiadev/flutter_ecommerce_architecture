import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class RequestLocationPermissionUsecase extends BaseUseCase<BaseError,
    RequestLocationPermissionUsecaseParams, AppPermission> {
  PermissionRepository permissionRepository;

  RequestLocationPermissionUsecase(this.permissionRepository);

  @override
  Future<Either<BaseError, AppPermission>> execute(
      {required RequestLocationPermissionUsecaseParams params}) {
    return permissionRepository.getLocationPermission();
  }
}

class RequestLocationPermissionUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
