// ignore_for_file: constant_identifier_names, unnecessary_null_comparison, prefer_is_empty

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import 'package:vangard_app/models/users.dart';

class DbHelper {
  late Database _database;

  static const String users = 'test.db';
  static const String userData = 'user';
  static const int version = 1;

  static const String C_UserID = 'user_id';
  static const String C_Email = 'email';
  static const String C_Password = 'password';

  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, users);
    var db = await openDatabase(path, version: version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $userData ("
        " $C_UserID TEXT, "
        " $C_Email TEXT,"
        " $C_Password TEXT, "
        " PRIMARY KEY ($C_UserID)"
        ")");
  }

  Future<int> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.insert(userData, user.toMap());
    return res;
  }

  Future<UserModel?> getLoginUser(String userId, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $userData WHERE "
        "$C_UserID = '$userId' AND "
        "$C_Password = '$password'");

    if (res.length > 0) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  Future<int> updateUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.update(userData, user.toMap(),
        where: '$C_UserID = ?', whereArgs: [user.userId]);
    return res;
  }

  Future<int> deleteUser(String userId) async {
    var dbClient = await db;
    var res = await dbClient
        .delete(userData, where: '$C_UserID = ?', whereArgs: [userId]);
    return res;
  }
}
