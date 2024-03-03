import 'package:domain/domain.dart';

abstract class UserRepository {
  Future<Either<NetworkError, User>> loginWithEmail(LoginRequest loginRequest);
  Future<Either<NetworkError, User>> signUpWithEmail(
      SignUpRequest signUpRequest);
  Future<Either<DatabaseError, void>> saveUser(User user);
  Future<Either<NetworkError, void>> forgotPassword();

  Future<Either<NetworkError, bool>> changePassword(
      {required ChangePasswordRequest changePasswordRequest});
  Future<Either<NetworkError, Logout>> logout(LogoutRequest logoutRequest);
  Future<Either<NetworkError, bool>> verifyotp(int otp);
  Future<Either<NetworkError, bool>> userExists({required String email});

  Future<Either<NetworkError, List<Product>>> getUserFavoriteProducts(
      {required int userId});

  Future<Either<NetworkError, UserProfile>> getUserProfile(
      {required int userId});

  Future<Either<NetworkError, UserSettings>> getUserSettings(
      {required int userId});

  Future<Either<NetworkError, UserProfile>> updateUserProfile(
      {required UserProfile userProfile});

  Future<Either<NetworkError, List<OrderItem>>> getOrderList(String userId);
}
