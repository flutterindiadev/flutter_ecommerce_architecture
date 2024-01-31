import 'package:domain/domain.dart';

abstract class NetworkPort {
  Future<Either<NetworkError, User>> loginWithEmail(
      {required LoginRequest loginRequest});
  Future<Either<NetworkError, User>> signUpWithEmail(
      {required SignUpRequest signUpRequest});
}
