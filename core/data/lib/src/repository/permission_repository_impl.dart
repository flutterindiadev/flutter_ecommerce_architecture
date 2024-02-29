import 'package:data/data.dart';
import 'package:domain/domain.dart';

class PermissionRepositoryImpl extends PermissionRepository {
  PermissionPort permissionPort;

  PermissionRepositoryImpl(this.permissionPort);

  @override
  Future<Either<PermissionError, AppPermission>> getLocationPermission() {
    return permissionPort.requestLocationPermission();
  }
}
