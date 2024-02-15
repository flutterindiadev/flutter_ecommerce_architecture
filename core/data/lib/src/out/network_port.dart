import 'package:domain/domain.dart';

abstract class NetworkPort {
  Future<Either<NetworkError, Cart>> addtoCart(
      {required AddtoCartRequest addtoCartRequest});

  Future<Either<NetworkError, Cart>> getCart({required int userId});
  Future<Either<NetworkError, User>> loginWithEmail(
      {required LoginRequest loginRequest});
  Future<Either<NetworkError, User>> signUpWithEmail(
      {
        required SignUpRequest signUpRequest}
      );

  Future<Either<NetworkError, void>> forgotPassword();

  Future<Either<NetworkError, List<Product>>> getProducts();

  Future<Either<NetworkError,Cart>> removeFromCart(
  {required RemovefromCartRequest removefromCartRequest}
      );
}
