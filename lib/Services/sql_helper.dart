import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../Models/ObjectModels/login.dart';

class SQLHelper {
  final String colId = 'id';
  final String colUsername = 'username';
  final String colPassword = 'password';

  final tableLogin = 'login_table';

  static Database _db;

  final int version = 1;

  SQLHelper._internal();

  static SQLHelper _singleton = SQLHelper._internal();

  factory SQLHelper() {
    return _singleton;
  }

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'user.db');
    Database dbUser =
        await openDatabase(dbPath, version: version, onCreate: _createDb);
    return dbUser;
  }

  Future _createDb(Database db, int version) async {
    String query = 'CREATE TABLE $tableLogin ($colId INTEGER PRIMARY KEY, ' +
        '$colUsername TEXT, $colPassword TEXT)';
    await db.execute(query);
  }

  Future<List<Login>> getLogin() async {
    if (_db == null) _db = await init();
    List<Map<String, dynamic>> loginListMap =
        await _db.query(tableLogin, orderBy: colUsername);
    List<Login> loginList = [];
    loginListMap.forEach((element) {
      loginList.add(Login.fromJson(element));
    });
    return loginList;
  }

  Future<int> insertLogin(Login login) async{
    int result = await _db.insert(tableLogin, login.toJson());
    return result;
  }

  Future<int> updateLogin(Login login) async {
    int result = await _db.update(tableLogin, login.toJson(),
        where: '$colUsername = ?', whereArgs: [login.username]);
    return result;
  }

  Future deleteAll() async {
    await _db.delete(tableLogin);
  }
}
