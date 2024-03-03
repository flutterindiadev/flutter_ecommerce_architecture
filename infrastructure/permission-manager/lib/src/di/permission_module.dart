import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_manager/src/permission_adaptor.dart';

@module
abstract class LocationModule {
  @lazySingleton
  PermissionPort providerLocationService() => PermissionAdaptor();
}
