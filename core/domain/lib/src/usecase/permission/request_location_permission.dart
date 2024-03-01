import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class RequestLocationPermission extends BaseUseCase<BaseError,
    RequestLocationPermissionParams, AppPermission> {
  PermissionRepository permissionRepository;

  RequestLocationPermission(this.permissionRepository);
  @override
  Future<Either<BaseError, AppPermission>> execute(
      {required RequestLocationPermissionParams params}) {
    return permissionRepository.getLocationPermission();
  }
}

class RequestLocationPermissionParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
