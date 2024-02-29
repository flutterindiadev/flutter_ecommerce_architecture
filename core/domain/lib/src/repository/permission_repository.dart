import 'package:domain/domain.dart';

abstract class PermissionRepository {
  Future<Either<PermissionError, AppPermission>> getLocationPermission();
}
