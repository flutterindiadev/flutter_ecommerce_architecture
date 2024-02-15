import 'package:domain/domain.dart';

import '../out/database_port.dart';
import '../out/network_port.dart';

class ProductRepositoryImpl extends ProductRepository {
  final DatabasePort databaseProvider;
  final NetworkPort networkPort;

  ProductRepositoryImpl(this.databaseProvider, this.networkPort);
  @override
  Future<Either<NetworkError, List<Product>>> getProducts() async {
    return await networkPort.getProducts();
  }

  @override
  Future<Either<NetworkError, Product>> getProductDetail(int productId) async {
    return await networkPort.getProductDetail(productId: productId);
  }

  @override
  Future<Either<NetworkError, List<ProductCategory>>>
      getProductCategory() async {
    return await networkPort.getProductCategory();
  }
}
