import 'package:domain/domain.dart';

abstract class UserRepository {
  Future<Either<NetworkError, User>> loginWithEmail(LoginRequest loginRequest);
  Future<Either<NetworkError, User>> signUpWithEmail(
      SignUpRequest signUpRequest);
  Future<Either<DatabaseError, void>> saveUser(User user);
  Future<Either<NetworkError, void>> forgotPassword();
  Future<Either<NetworkError, Logout>> logout(LogoutRequest logoutRequest);
  Future<Either<NetworkError, bool>> verifyotp(int otp);

}
