import 'package:precios/model/tienda.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DB {
  static Future<void> createTables(sql.Database database) async {
    String tablaTiendas = """CREATE TABLE "tienda" (
                                "id"	INTEGER,
                                "nombre"	TEXT,
                                "imagen"  TEXT,                                
                                PRIMARY KEY("id" AUTOINCREMENT)
                              )""";
    String tablaProductos = """CREATE TABLE "productos" (
                                "id"	INTEGER,
                                "nombre"	TEXT,
                                "precio"	INTEGER,
                                "categoria" TEXT,
                                "fecha" TEXT,
                                "tienda"	INTEGER,
                              PRIMARY KEY("id" AUTOINCREMENT),
                              FOREIGN KEY("id") REFERENCES "tienda"("id")
                            )""";
    await database.execute("PRAGMA forign_keys = ON");
    await database.execute(tablaTiendas);
    await database.execute(tablaProductos);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('productos.db', version: 5,
        onCreate: (sql.Database database, version) async {
      await createTables(database);
    });
  }

  static Future<int> crearTienda(
      /*int? id,*/ String nombre, String? imagen) async {
    final db = await DB.db();
    final data = {'nombre': nombre, 'imagen': imagen};
    final idR = await db.insert('tienda', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return idR;
  }

  static Future<int> actualizarTienda(
      int id, String nombre, String? imagen) async {
    final db = await DB.db();
    final data = {'id': id,'nombre': nombre, 'imagen': imagen};
    final idR = await db.update('tienda', data, where: "id = ?", whereArgs: [id] ,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return idR;
  }

  static Future<int> crearProducto(
      String nombre, double precio, String fecha, String? categoria, int tienda) async {
    final db = await DB.db();
    final data = {
      'nombre'   : nombre,
      'precio'   : precio,
      'fecha'    : fecha,
      'categoria':categoria,
      'tienda'   : tienda
    };
    final idR = await db.insert('productos', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return idR;
  }

  static Future<List<Map<String, dynamic>>> getTiendas() async {
    final db = await DB.db();
    return db.query('tienda');
  }

  static Future<List<Map<String, dynamic>>> getTienda(int id) async {
    final db = await DB.db();
    return db.query('tienda', where: 'id=?', whereArgs: [id]);
  }

  static Future<int> deleteTienda(int id) async {
    final db = await DB.db();
    return db.delete('tienda', where: 'id = ?', whereArgs: [id]);
  }
  
  static Future<int> deleteAllTiendas () async{
    final db = await DB.db();
    return db.delete('tienda');
  }

   static Future<List<Map<String, dynamic>>> getProductos() async {
    final db = await DB.db();
    return db.query('productos');
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
