import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'productos.db'),
        onCreate: (db, version) {
          return db.execute(""" CREATE TABLE "productos" (
              "id"	INTEGER,
              "nombre"	TEXT,
              "tienda"	TEXT,
              PRIMARY KEY("id" AUTOINCREMENT)
            )"""
          );
        }, 
        version: 1);
  }
}
