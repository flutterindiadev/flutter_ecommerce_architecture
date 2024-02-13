import 'package:domain/domain.dart';

abstract class NetworkPort {

  Future<Either<NetworkError, Cart>> addtoCart( AddtoCartRequest addtoCartRequest
      );

  Future<Either<NetworkError, Cart>> getCart(int userId);
  Future<Either<NetworkError, User>> loginWithEmail(
      {required LoginRequest loginRequest});
  Future<Either<NetworkError, User>> signUpWithEmail(
      {required SignUpRequest signUpRequest});

  Future<Either<NetworkError, void>> forgotPassword();

  Future<Either<NetworkError, List<Product>>> getProducts();
}
