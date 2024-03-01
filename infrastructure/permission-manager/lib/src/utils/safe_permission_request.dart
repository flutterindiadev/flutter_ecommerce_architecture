import 'package:dartz/dartz.dart';
import 'package:data/data.dart';

Future<Either<PermissionError, T>> safePermissionCall<T>(
    Future<T> permissionRequest) async {
  try {
    final originalResponse = await permissionRequest;
    return Right(originalResponse);
  } catch (exception) {
    return Left(PermissionError(
        errorMessage: exception.toString(),
        locationError: '',
        cause: Exception(exception.toString())));
  }
}
