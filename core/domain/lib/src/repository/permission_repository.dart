import 'package:domain/domain.dart';

abstract class PermissionRepository {
  Future<Either<PermissionError, AppPermission>> getLocationPermission();

  Future<Either<PermissionError, bool>> checkLocationPermission();

  Future<Either<PermissionError, bool>> checkLocationEnabledStatus();

  Future<Either<PermissionError, AppPermission>> getNotificationPermission();
}
