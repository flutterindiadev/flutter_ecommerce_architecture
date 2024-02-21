import 'package:domain/domain.dart';

import '../out/database_port.dart';
import '../out/network_port.dart';

class UserRepositoryImpl extends UserRepository {
  final DatabasePort databaseProvider;
  final NetworkPort networkPort;

  UserRepositoryImpl(this.databaseProvider, this.networkPort);

  @override
  Future<Either<NetworkError, User>> loginWithEmail(LoginRequest loginRequest) {
    return networkPort.loginWithEmail(loginRequest: loginRequest);
  }

  @override
  Future<Either<DatabaseError, void>> saveUser(User user) {
    return databaseProvider.saveUser(user);
  }

  @override
  Future<Either<NetworkError, User>> signUpWithEmail(
      SignUpRequest signUpRequest) {
    return networkPort.signUpWithEmail(signUpRequest: signUpRequest);
  }

  @override
  Future<Either<NetworkError, void>> forgotPassword() {
    return networkPort.forgotPassword();
  }

  @override
  Future<Either<NetworkError, Logout>> logout(LogoutRequest logoutRequest) {
    return networkPort.logout(logoutRequest: logoutRequest);
  }

  Future<Either<NetworkError, bool>> verifyotp(int otp) {
    return networkPort.verifyotp(otp: otp);
  }

  @override
  Future<Either<NetworkError, List<OrderItem>>> getOrderList(String userId) {
   return networkPort.getOrderList(userId: userId);
  }
}
