import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DnHelper {
  late Database _db;
  Future<Database> get db async {
    _db ??= await initializeDb();
    return _db;
  }
  /*void(){
    db.then((value) => null)
  }*/

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), 'demo.db');
    var usersDb = await openDatabase(dbPath, onCreate: createDb);
    return usersDb;
  }

  Future<FutureOr<void>> createDb(Database db, int version) async {
    await db.execute(
        "Create table users(id text primary key, mail text, password text)");
  }
}
