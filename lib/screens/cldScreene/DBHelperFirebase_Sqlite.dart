import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';
//import io.flutter.plugin.common.PluginRegistry
class DBHelperFirebase {

  final user =  FirebaseAuth.instance;
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'signinTable.db'),
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE signinTable(id INTEGER PRIMARY KEY , name TEXT , surname TEXT, email TEXT, mobile INTEGER, password TEXT)");
        }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelperFirebase.database();
    db.insert(table, data);
  }

  static Future<List<Map<String, Object>>> getData(String table) async {
    final db = await DBHelperFirebase.database();
    return db.query(table);
  }
  static Future<void> deleteDataSignIn(String table, String id) async {
    final db = await DBHelperFirebase.database();

    db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}