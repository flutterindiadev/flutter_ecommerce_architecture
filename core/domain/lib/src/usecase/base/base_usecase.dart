import 'package:dartz/dartz.dart';
import 'params.dart';

abstract class BaseUseCase<E, P extends Params, T> {
  Future<Either<E, T>> execute({required P params});
}
