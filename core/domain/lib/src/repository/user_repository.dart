import 'package:domain/domain.dart';

abstract class UserRepository {
  Future<Either<NetworkError, User>> loginWithEmail(LoginRequest loginRequest);

  Future<Either<NetworkError, User>> signUpWithEmail(
      SignUpRequest signUpRequest);

  Future<Either<DatabaseError, User>> saveUser(User user);
}
