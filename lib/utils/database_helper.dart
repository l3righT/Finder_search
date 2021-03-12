import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io'as io;
import 'package:synchronized/synchronized.dart';

class DatabaseHelper{
  static Database _db;
  DatabaseHelper.internal();
  final _lock = new Lock();

  String sqlCreate = '''
  create table if not exists members(
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    user_name TEXT,  
    facebook TEXT, 
    wiki TEXT)
  ''';

  Future<Database> getDb() async {
    if (_db == null) {
      io.Directory documentDirectory = await getApplicationDocumentsDirectory();

      String path = join(documentDirectory.path, 'mymembers.db');

      await _lock.synchronized(() async {
        if (_db == null) {
          _db = await openDatabase(path, version: 1);
        }
      });
    }

    return _db;
  }
// insert
  Future saveData (Map member) async{
    var dbClient = await getDb();
    String sqlInsert = '''
  INSERT INTO members(userName,facebook,wiki)
  VALUES(?,?,?)
  ''';

    await dbClient.rawQuery(sqlInsert,[
      member['userName'],
      member['facebook'],
      member['wiki'],
    ]);
    print('Data is saved !!!');
  }
  //select
  Future getList() async{
    var dbClient = await getDb();
    var sqlSelect = '''
    SELECT * FROM members
    ''';
    return await dbClient.rawQuery(sqlSelect);
  }

  Future remove(int id) async{
    var dbClient = await getDb();
    var sqlRemove = '''
    DELETE FROM members WHERE id =?
    ''';
    return await dbClient.rawQuery(sqlRemove,[id]);
  }


  Future initDatabase() async {
    var dbClient = await getDb();
    // Create table
    await dbClient.rawQuery(sqlCreate);
    print('Table is created');
  }


}


