import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_manager/src/utils/safe_permission_request.dart';

class PermissionAdaptor implements PermissionPort {
  @override
  Future<Either<PermissionError, AppPermission>>
      requestLocationPermission() async {
    final response = await safePermissionCall(Permission.location
        .onDeniedCallback(() async => await openAppSettings())
        .onPermanentlyDeniedCallback(() async => await openAppSettings())
        .request());

    return response.fold((l) => Left(l),
        (r) => Right(AppPermission(isLocationPermissionGranted: r.isGranted)));
  }

  @override
  Future<Either<PermissionError, bool>> checkLocationPermission() async {
    final response = await safePermissionCall(Permission.location.status);

    return response.fold((l) => Left(l), (r) => Right(r.isGranted));
  }

  @override
  Future<Either<PermissionError, bool>> checkLocationEnabledStatus() async {
    final response =
        await safePermissionCall(Permission.location.serviceStatus);

    return response.fold((l) => Left(l), (r) => Right(r.isEnabled));
  }

  @override
  Future<Either<PermissionError, AppPermission>>
      getNotificationPermission() async {
    final response =
        await safePermissionCall(Permission.notification.request());

    return response.fold(
        (l) => Left(l),
        (r) =>
            Right(AppPermission(isNotificationPermissionGranted: r.isGranted)));
  }
}
