import 'package:domain/domain.dart';

abstract class LocationPort {
  Future<Either<LocationError, Location>> getCurrentLocation();
}
