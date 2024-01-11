import 'package:domain/domain.dart';

abstract class DatabasePort {
  Future<Either<DatabaseError, User>> saveUser(User user);
}
