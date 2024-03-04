import 'package:domain/domain.dart';

import '../../data.dart';

class LocationRepoImpl extends LocationRepository {
  final LocationPort locationPort;

  LocationRepoImpl(this.locationPort);

  @override
  Future<Either<LocationError, Location>> getCurrentLocation() {
    return locationPort.getCurrentLocation();
  }
}
