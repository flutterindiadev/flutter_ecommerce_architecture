import 'package:domain/domain.dart';

abstract class PermissionPort {
  Future<Either<PermissionError, AppPermission>> requestLocationPermission();

  Future<Either<PermissionError, bool>> checkLocationPermission();

  Future<Either<PermissionError, bool>> checkLocationEnabledStatus();

  Future<Either<PermissionError, AppPermission>> getNotificationPermission();
}
