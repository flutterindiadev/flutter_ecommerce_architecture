import 'package:domain/domain.dart';

abstract class DatabasePort {
  Future<Either<DatabaseError, void>> saveUser(User user);



}



