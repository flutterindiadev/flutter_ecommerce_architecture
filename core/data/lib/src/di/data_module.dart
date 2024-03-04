import 'package:data/data.dart';
import 'package:data/src/repository/address_repository_impl.dart';
import 'package:data/src/repository/cart_repository_impl.dart';
import 'package:data/src/repository/order_repository_impl.dart';
import 'package:data/src/repository/product_repository_impl.dart';
import 'package:data/src/repository/user_repository_impl.dart';
import 'package:data/src/repository/voucher_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @lazySingleton
  UserRepository userRepositoryProvider(
      DatabasePort databasePort, NetworkPort networkPort) {
    return UserRepositoryImpl(databasePort, networkPort);
  }

  @lazySingleton
  AddressRepository addressRepository(NetworkPort networkPort) {
    return AddressRepositoryImpl(networkPort);
  }

  @lazySingleton
  CartRepository cartRepository(NetworkPort networkPort) {
    return CartRepositoryImpl(networkPort);
  }

  @lazySingleton
  LocationRepository locationRepository(LocationPort locationPort) {
    return LocationRepoImpl(locationPort);
  }

  @lazySingleton
  OrderRepository orderRepository(NetworkPort networkPort) {
    return OrderRepositoryImpl(networkPort);
  }

  @lazySingleton
  ProductRepository productRepository(NetworkPort networkPort) {
    return ProductRepositoryImpl(networkPort);
  }

  @lazySingleton
  VoucherRepository voucherRepository(NetworkPort networkPort) {
    return VoucherRepositoryImpl(networkPort);
  }

  @lazySingleton
  PermissionRepository permissionRepository(PermissionPort permissionPort) {
    return PermissionRepositoryImpl(permissionPort);
  }
}
