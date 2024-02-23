import 'package:domain/domain.dart';

abstract class ProductRepository {
  Future<Either<NetworkError, List<Product>>> getProducts();
  Future<Either<NetworkError, Product>> getProductDetail(int productId);
  Future<Either<NetworkError, List<ProductCategory>>> getProductCategory();
  Future<Either<NetworkError, List<Product>>> searchProducts(
      String productName);

  Future<Either<NetworkError, List<Product>>> selectCategory(String category);

  Future<Either<NetworkError, List<Promotion>>> getPromotions();
}
