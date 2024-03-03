import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:location_geolocator/src/location_adaptor.dart';

@module
abstract class LocationModule {
  @lazySingleton
  LocationPort providerLocationService() => LocationAdaptor();
}
