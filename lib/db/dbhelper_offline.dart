import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelp {
  static final String tname = "villages";
  // static final String tname = "Dictionary";

  static Database dbExists;

  Future<Database> get db async {
    if (dbExists != null) {
      print('dbstatus '+'Db already exists');
      return dbExists;
    } else {
      dbExists = await initdb();
      return dbExists;
    }
  }

  Future initdb() async {
    final dbpath = await getDatabasesPath();
    final path = join('lib/assets', 'lib/assets/territories.db');
    // final path = join('assets', 'territories.db');

    final exist = await databaseExists(path);

    if (!exist) {
      print('dbstatus '+'creating new copy from assets');

      try{
        await Directory(dirname(path)).create(recursive: true);
      } catch (_){

      }

      ByteData data = await rootBundle.load(join("lib/assets", "territories.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print('dbstatus '+'Opening database');
    }

    return await openDatabase(path);
  }
}