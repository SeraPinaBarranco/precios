import 'package:flutter/material.dart';
import 'package:precios/model/db.dart';
import 'package:precios/model/tienda.dart';

class TiendaProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _nombre = "";
  String _imagen = "";
  List<Map<String, dynamic>> _tiendasList = [];
  Map<String, dynamic> _tienda = {};
  //Tienda? _tiendaObj = null;

  int _idTienda = -1;

  // TiendaProvider() {
  //   cargasrTiendas();
  // }

  List<Map<String, dynamic>> get getAllTiendas => [..._tiendasList];
  String get getNombre => _nombre;
  Map<String, dynamic> get getTienda => _tienda;
  String get getImagen => _imagen;
  int get getIdTienda => _idTienda;

  void idT(int id) {
    _idTienda = id;
    //print("${_idTienda} -- ID");
    //notifyListeners();
  }

  cargasrTiendas() async {
    final tiendas = await DB.getTiendas();

    _tiendasList = tiendas;

    notifyListeners();
  }

  cargarTienda(int id) async {
    List<Map<String, dynamic>> t = await DB.getTienda(id);
    _tienda = t[0];
    notifyListeners();
  }

  setNombre(String n, String? im) {
    _nombre = n;
    _imagen = im ?? "";
    Tienda(nombre: n, imagen: im);

    notifyListeners();
  }

  nuevaTienda(String n, String t) async {
    int resp = await DB.crearTienda(n, t);

    cargasrTiendas();
  }

  borrarTienda(int id) {
    DB.deleteTienda(id);
    cargasrTiendas();
  }

  borrarTodasTiendas() {
    DB.deleteAllTiendas();
    cargasrTiendas();
  }

  //List<Tienda> get getTiendasList => tiendasList;

}
