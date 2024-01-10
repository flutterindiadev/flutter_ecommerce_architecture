import 'package:domain/domain.dart';

import '../out/database_port.dart';
import '../out/network_port.dart';

class UserRepositoryImpl extends UserRepository {
  final DatabasePort databaseProvider;
  final NetworkPort networkPort;

  UserRepositoryImpl(this.databaseProvider, this.networkPort);

  @override
  Future<Either<NetworkError, User>> loginWithEmail(LoginRequest loginRequest) {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseError, User>> saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkError, User>> signUpWithEmail(
      SignUpRequest signUpRequest) {
    return networkPort.signUpWithEmail(signUpRequest: signUpRequest);
  }
}
