import 'package:domain/domain.dart';

abstract class ProductRepository {
  Future<Either<NetworkError, List<Product>>> getProducts();


}
