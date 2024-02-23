import 'package:domain/domain.dart';

import '../out/database_port.dart';
import '../out/network_port.dart';

class ProductRepositoryImpl extends ProductRepository {
  final DatabasePort databaseProvider;
  final NetworkPort networkPort;

  ProductRepositoryImpl(this.databaseProvider, this.networkPort);
  @override
  Future<Either<NetworkError, List<Product>>> getProducts() {
    return networkPort.getProducts();
  }

  @override
  Future<Either<NetworkError, Product>> getProductDetail(int productId) {
    return networkPort.getProductDetail(productId: productId);
  }

  @override
  Future<Either<NetworkError, List<ProductCategory>>>
      getProductCategory() async {
    return networkPort.getProductCategory();
  }

  @override
  Future<Either<NetworkError, List<Product>>> searchProducts(
      String productName) {
    return networkPort.searchProducts(productName: productName);
  }

  @override
  Future<Either<NetworkError, List<Product>>> selectCategory(String category) {
    return networkPort.selectCategory(category: category);
  }

  @override
  Future<Either<NetworkError, List<Promotion>>> getPromotions() {
    return networkPort.getPromotions();
  }
}
