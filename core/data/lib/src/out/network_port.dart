import 'package:domain/domain.dart';

abstract class NetworkPort {
  Future<Either<NetworkError, User>> loginWithEmail();
  Future<Either<NetworkError, User>> signUpWithEmail(
      {required SignUpRequest signUpRequest});
}
