import 'package:dartz/dartz.dart';
import 'package:data/data.dart';

Future<Either<LocationError, T>> safeLocationCall<T>(
    Future<T> locationCall) async {
  try {
    final originalResponse = await locationCall;
    return Right(originalResponse);
  } catch (exception) {
    return Left(
      LocationError(
        message: exception.toString(),
        cause: Exception(exception.toString()),
        locationError: '',
      ),
    );
  }
}
