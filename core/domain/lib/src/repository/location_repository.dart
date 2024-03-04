import 'package:domain/domain.dart';

abstract class LocationRepository {
  Future<Either<LocationError, Location>> getCurrentLocation();
}
