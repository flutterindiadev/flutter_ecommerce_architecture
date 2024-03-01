import 'package:data/data.dart';
import 'package:domain/domain.dart';

class PermissionRepositoryImpl extends PermissionRepository {
  PermissionPort permissionPort;

  PermissionRepositoryImpl(this.permissionPort);

  @override
  Future<Either<PermissionError, AppPermission>> getLocationPermission() {
    return permissionPort.requestLocationPermission();
  }

  @override
  Future<Either<PermissionError, bool>> checkLocationPermission() {
    return permissionPort.checkLocationPermission();
  }

  @override
  Future<Either<PermissionError, bool>> checkLocationEnabledStatus() {
    return permissionPort.checkLocationEnabledStatus();
  }

  @override
  Future<Either<PermissionError, AppPermission>> getNotificationPermission() {
    return permissionPort.getNotificationPermission();
  }
}
