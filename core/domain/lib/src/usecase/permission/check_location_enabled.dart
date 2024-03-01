import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class CheckLocationEnabledStatusUsecase extends BaseUseCase<BaseError,
    CheckLocationEnabledStatusUsecaseParams, bool> {
  PermissionRepository permissionRepository;

  CheckLocationEnabledStatusUsecase(this.permissionRepository);
  @override
  Future<Either<BaseError, bool>> execute(
      {required CheckLocationEnabledStatusUsecaseParams params}) {
    return permissionRepository.checkLocationEnabledStatus();
  }
}

class CheckLocationEnabledStatusUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
