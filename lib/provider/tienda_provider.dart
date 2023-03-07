import 'package:flutter/foundation.dart';
import 'package:precios/model/db.dart';
import 'package:precios/model/tienda.dart';

class TiendaProvider with ChangeNotifier {
  String nombre = "";
  List<Tienda> tiendasList = [];

  cargasrTiendas() async {
    //final tiendas = await DB.db.getTodasLasTiendas();
    //await DB.crearTienda(nombre);

    //tiendasList = DB.ti;

    notifyListeners();
  }

  setNombre(String n) {
    nombre = n;
    Tienda(nombre: n);

    notifyListeners();
  }

  List<Tienda> get getTiendasList => tiendasList;
  String get getNombre => nombre;
}
