import 'package:domain/domain.dart';

abstract class PermissionPort {
  Future<Either<PermissionError, AppPermission>> requestLocationPermission();

  
}
