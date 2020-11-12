import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// analog info
class DBHelper {
  Future initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "lib/assets/territories.db");  /// db file name
    // final path = join(dbPath, "territories.db");  /// db file name

    final eksis = await databaseExists(path);

    if (eksis) {
      /// DB SUDAH ADA
      /// BUKA DB
      print('DB SUDAH ADA');
    } else {
      /// DB TIDAK ADA, BUAT YANG BARU
      print('MEMBUAT KOPIAN DARI ASSETS');

      try{
        await Directory(dirname(path)).create(recursive: true);
      } catch(_){
      }

      ByteData data = await rootBundle.load(join("lib/assets", "territories.db"));
      // ByteData data = await rootBundle.load(join("assets", "territories.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);

      print('DB COPIED');
    }

    await openDatabase(path);
  }




  /// BATAS ORIG analog info

  /// NG

  static Database db_SqliteApi;

  static Future<bool> initialize() async {
    if (db_SqliteApi == null) {
      db_SqliteApi = DBHelper() as Database;

      var rows = await getData();

      if (rows.isEmpty) {
        print('ROWS IS EMPTYYYYyyYyyyYy');
        // loadSampleData();
      } else {
        print(rows.length.toString());/// NG BELUM MUNCUL
      }
    }

    return db_SqliteApi.isOpen;
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    return await db_SqliteApi.rawQuery('SELECT * FROM villages');
  }
}