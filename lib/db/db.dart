import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Db {
  static Database db_SqliteApi;
  static String _path;

  /// NG
  static List<int> _bytes;

  static Future<bool> initialize() async {
    if (db_SqliteApi == null) {
      db_SqliteApi = await _configureDb();

      var rows = await getData();

      if (rows.isEmpty) {
        loadSampleData();
      }
    }

    return db_SqliteApi.isOpen;
  }

  static Future<Database> _configureDb() async {
    _path = await getDatabasesPath();
    // _path = _path + '/' + 'assets/territories.db';
    _path = _path + '/' + 'lib/assets/territories.db';
    // _path = _path + '/' + 'mydb.db';

    String p = _path + '/' + 'lib/assets/territories.db';

    // Only copy if the database doesn't exist
    if (FileSystemEntity.typeSync(p) == FileSystemEntityType.notFound) {
      // Load database from asset and copy
      ByteData data = await rootBundle.load(join('lib/assets', 'territories.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      print("cetak ${bytes}");///BS

      _bytes = bytes;///NG

      // Save copied asset to documents
      await new File(_path).writeAsBytes(_bytes);
    } else /// else NG


    return await openDatabase(
      _path,
    );
    // return await openDatabase(
    //   _path,
    //   onCreate: onCreateDb,
    //   version: 1
    // );
  }

  static void onCreateDb(Database db, int versi) {
    db.execute('''
    CREATE TABLE villages(title TEXT)
    ''');
    // db.execute('''
    // CREATE TABLE items(ITEM TEXT)
    // ''');
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    return await db_SqliteApi.rawQuery('SELECT * FROM villages');
  }

  static Future<bool> insert(Map<String, dynamic> data ) async {
    return await db_SqliteApi.insert('villages', data) > 0;
  }

  static void loadSampleData() async {
    Map<String, String> map = Map();
    for (int i=0; i<10; i++) {
      map['ITEM'] = "item : $i";
      insert(map);
    }
  }
}