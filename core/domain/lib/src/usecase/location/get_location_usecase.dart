import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetLocationUsecase
    extends BaseUseCase<BaseError, GetLocationUsecaseParams, Location> {
  LocationRepository locationRepository;

  GetLocationUsecase(this.locationRepository);

  @override
  Future<Either<BaseError, Location>> execute(
      {required GetLocationUsecaseParams params}) {
    return locationRepository.getCurrentLocation();
  }
}

class GetLocationUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
