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
}