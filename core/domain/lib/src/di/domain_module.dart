import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  @lazySingleton
  GetLocationUsecase getLocationUsecaseProvider(
      LocationRepository locationRepository) {
    return GetLocationUsecase(locationRepository);
  }

  @lazySingleton
  RequestLocationPermissionUsecase requestLocationPermissionUsecaseProvider(
      PermissionRepository permissionRepository) {
    return RequestLocationPermissionUsecase(permissionRepository);
  }
}
