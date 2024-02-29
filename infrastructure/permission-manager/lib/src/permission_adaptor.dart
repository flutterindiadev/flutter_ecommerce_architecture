import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_manager/src/utils/safe_permission_request.dart';

class PermissionAdaptor implements PermissionPort {
  @override
  Future<Either<PermissionError, AppPermission>>
      requestLocationPermission() async {
    final response = await safeLocationCall(Permission.location.request());

    return response.fold((l) => Left(l),
        (r) => Right(AppPermission(isLocationPermissionGranted: true)));
  }
}
