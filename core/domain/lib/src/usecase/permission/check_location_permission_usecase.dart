import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class CheckLocationPermissionUsecase
    extends BaseUseCase<BaseError, CheckLocationPermissionUsecaseParams, bool> {
  PermissionRepository permissionRepository;

  CheckLocationPermissionUsecase(this.permissionRepository);

  @override
  Future<Either<BaseError, bool>> execute(
      {required CheckLocationPermissionUsecaseParams params}) {
    return permissionRepository.checkLocationPermission();
  }
}

class CheckLocationPermissionUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
