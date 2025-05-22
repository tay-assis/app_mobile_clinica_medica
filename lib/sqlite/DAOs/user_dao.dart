import 'package:drift/drift.dart';
import '../models/user.dart';
import '../database.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  // SELECT * FROM USERS
  Future<List<User>> selectUsers() {
    return select(users).get();
  }

  // SELECT * FROM USERS WHERE id == ID
  Future<User> selectUserByID(int id) {
    return (select(users)..where((t) => t.id.equals(id))).getSingle();
  }

  // SELECT * FROM USERS WHERE email == EMAIL
  Future<User> findByEmail(String email) {
    return (select(users)..where((u) => u.email.equals(email))).getSingle();
  }

  // SELECT COUNT(*) FROM USERS
  Future<int> countUsers() async {
    final query = selectOnly(users)..addColumns([users.id.count()]);
    final row = await query.getSingle();
    return row.read(users.id.count()) ?? 0;
  }

  // INSERT INTO USERS (email, firebaseUID) VALUES (...)
  // firebase generates an UID (userID) when sign up
  Future<int> insertUser(String tipo, String email, String firebaseUid) async {
    final int insertedId = await into(users).insert(
      UsersCompanion(
        tipo: Value(tipo),
        email: Value(email),
        firebaseUid: Value(firebaseUid),
      ),
    );

    return insertedId;
  }

  // UPDATE USERS SET ... WHERE id == ID
  Future<void> modifyUser({
    required int id,
    String? email,
    String? firebaseUid,
  }) async {
    final companion = UsersCompanion(
      email: email != null ? Value(email) : Value.absent(),
      firebaseUid: firebaseUid != null ? Value(firebaseUid) : Value.absent(),
    );
    await (update(users)..where((t) => t.id.equals(id))).write(companion);
  }

  // DELETE FROM USERS
  Future<void> deleteUsers() async {
    await delete(users).go();
    await customStatement("DELETE FROM sqlite_sequence WHERE name = 'users';");
  }

  // DELETE FROM USERS WHERE id == ID
  Future<void> deleteUserByID(int id) async {
    await (delete(users)..where((t) => t.id.equals(id))).go();
  }
}
