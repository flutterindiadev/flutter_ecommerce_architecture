/// Support for doing something awesome.
///
/// More dartdocs go here.
library domain;

export 'package:dartz/dartz.dart';
export 'package:shared/shared.dart';

export 'src/di/domain_dependency_configurator.dart';
//repository contracts
export 'src/repository/address_repository.dart';
export 'src/repository/cart_repository.dart';
export 'src/repository/location_repository.dart';
export 'src/repository/order_repository.dart';
export 'src/repository/product_repository.dart';
export 'src/repository/user_repository.dart';
export 'src/repository/voucher_repository.dart';
//use-cases
export 'src/usecase/base/params.dart';
//useCaseParams
export 'src/usecase/cart/get_cart_usecase.dart';
export 'src/usecase/products/get_products_usecase.dart';
export 'src/usecase/user/login_usecase.dart';
