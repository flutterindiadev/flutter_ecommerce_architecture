import 'package:dartz/dartz.dart';
import 'package:data/data.dart';

Future<Either<DatabaseError, T>> safeDbCall<T>(Future<T> dbCall) async {
  try {
    final originalResponse = await dbCall;
    return Right(originalResponse);
  } catch (exception) {
    return Left(
      DatabaseError(
        message: exception.toString(),
        databaseError: 0,
        // Should be error as per the case
        cause: Exception(exception.toString()),
      ),
    );
  }
}
