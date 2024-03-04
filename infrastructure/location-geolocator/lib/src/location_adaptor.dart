import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_geolocator/src/utils/safe_location_call.dart';

class LocationAdaptor implements LocationPort {
  const LocationAdaptor();

  @override
  Future<Either<LocationError, Location>> getCurrentLocation() async {
    final response = await safeLocationCall(Geolocator.getCurrentPosition());

    return response.fold((l) => Left(l), (r) {
      final Location location = Location(r.latitude, r.longitude);

      return Right(location);
    });
  }
}
