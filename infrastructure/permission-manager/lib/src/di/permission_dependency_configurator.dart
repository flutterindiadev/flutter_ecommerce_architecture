import 'package:dependency_injection/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'permission_dependency_configurator.config.dart';

//global private function
@InjectableInit(initializerName: r'$initLocationGetIt')
_configureModuleDependencies(GetIt getIt) => $initLocationGetIt(getIt);

class PermissionDependencyConfigurator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureModuleDependencies(getIt));
  }
}
