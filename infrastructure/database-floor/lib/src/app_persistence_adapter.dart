import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:database_floor/src/app_database.dart';
import 'package:database_floor/src/utils/safe_db_api.dart';

class AppPersistenceAdapter implements DatabasePort {
  final AppDatabase appDatabase;

  AppPersistenceAdapter(this.appDatabase);

  @override
  Future<Either<DatabaseError, User>> saveUser(User user) async {
    final response = await safeDbCall(appDatabase.userDao.insertUser(user));

    return response.fold((l) => Left(l), (r) => right(r));
  }
}
