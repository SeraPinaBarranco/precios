import 'package:precios/model/tienda.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DB {
  static Future<void> createTables(sql.Database database) async {
    String tablaTiendas = """CREATE TABLE "tienda" (
                                "id"	INTEGER,
                                "nombre"	TEXT,
                                PRIMARY KEY("id" AUTOINCREMENT)
                              )""";
    String tablaProductos = """CREATE TABLE "productos" (
                                "id"	INTEGER,
                                "nombre"	TEXT,
                                "tienda"	INTEGER,
                              "precio"	INTEGER,
                              "fecha" TEXT
                              PRIMARY KEY("id" AUTOINCREMENT),
                              FOREIGN KEY("id") REFERENCES "tienda"("id")
                            )""";
    await database.execute("PRAGMA forign_keys = ON");
    await database.execute(tablaTiendas);
    await database.execute(tablaProductos);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('productos.db', version: 2,
        onCreate: (sql.Database database, version) async {
      await createTables(database);
    });
  }

  static Future<int> crearTienda(/*int? id,*/ String nombre) async {
    final db = await DB.db();
    final data = {'nombre': nombre};
    final idR = await db.insert('tienda', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return idR;
  }

   static Future<int> crearProducto(String nombre, double precio, String fecha, int tienda) async {
    final db = await DB.db();
    final data = {'nombre': nombre, 'precio': precio, 'fecha': fecha, 'tienda': tienda};
    final idR = await db.insert('tienda', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return idR;
  }

  static Future<List<Map<String, dynamic>>> getTiendas() async {
    final db = await DB.db();
    return db.query('tienda');
  }

  
}

// import 'dart:async';

// import 'package:precios/model/tienda.dart';
// import 'package:sqflite/sqflite.dart';

// import 'package:path/path.dart';

// class DB {
//   final _ddbb = database();

//   static Future<Database> database() async {
//     Database db = openDatabase(join(await getDatabasesPath(), 'productos.db'),
//         onCreate: (db, version) async {
//       await createTables(db);
//     }, version: 1) as Database;
//     return db;
//   }

//   static Future<void> createTables(Database database) async {
//     String tablaTiendas = """CREATE TABLE "tienda" (
//                                 "id"	INTEGER,
//                                 "nombre"	TEXT,
//                                 PRIMARY KEY("id" AUTOINCREMENT)
//                               )""";
//     String tablaProductos = """CREATE TABLE "productos" (
//                                 "id"	INTEGER,
//                                 "nombre"	TEXT,
//                                 "tienda"	INTEGER,
//                               "precio"	INTEGER,
//                               PRIMARY KEY("id" AUTOINCREMENT),
//                               FOREIGN KEY("id") REFERENCES "tienda"("id")
//                             )""";
//     await database.execute("PRAGMA forign_keys = ON");
//     await database.execute(tablaTiendas);
//     await database.execute(tablaProductos);
//   }

//   Future<void> insertTienda(Tienda tienda) async {
//     final db = await database();

//     await db.insert('tienda', tienda.toMap());
//   }

//   Future<List<Tienda>> getTiendas() async {
//     final db = await database();
//     final res = await db.query('tienda');

//     return res.isNotEmpty ? res.map((e) => Tienda.fromJson(e)).toList() : [];
//   }
// }
