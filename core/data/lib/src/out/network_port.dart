import 'package:domain/domain.dart';

abstract class NetworkPort {

  Future<Either<NetworkError, Cart>> addtoCart();

  Future<Either<NetworkError, Cart>> getCartList();
  Future<Either<NetworkError, User>> loginWithEmail(
      {required LoginRequest loginRequest});
  Future<Either<NetworkError, User>> signUpWithEmail(
      {required SignUpRequest signUpRequest});

  Future<Either<NetworkError, void>> forgotPassword();

  Future<Either<NetworkError, List<Product>>> getProducts();
}
