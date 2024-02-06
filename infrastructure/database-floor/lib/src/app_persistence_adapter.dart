import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:database_floor/src/app_database.dart';
import 'package:database_floor/src/model/user_entity.dart';
import 'package:database_floor/src/utils/safe_db_api.dart';

class AppPersistenceAdapter implements DatabasePort {
  final AppDatabase appDatabase;

  AppPersistenceAdapter(this.appDatabase);

  @override
  Future<Either<DatabaseError, void>> saveUser(User user) async {
    UserDBEntity _dbEntity = UserDBEntity();
    final response =
        await safeDbCall(appDatabase.userDao.insertUser(_dbEntity));

    return response.fold((l) => Left(l), (r) => right(r));
  }
}
