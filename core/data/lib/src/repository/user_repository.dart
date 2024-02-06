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
}
