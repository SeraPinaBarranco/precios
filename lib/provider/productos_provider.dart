import 'package:flutter/material.dart';
import 'package:precios/model/db.dart';

class ProductosProvider extends ChangeNotifier {
  //final db = DB.db();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> tiendas = [];

  String valorCombo = "";
  String _valorCombo = "";

  String _nombre = "";
  double _precio = 0;

  setNombre(String nombreProducto) {
    _nombre = nombreProducto;
    //print("PROVIDER $nombre");
  }

  setPrecio(double precioProducto) {
    _precio = precioProducto;

    //print("PROVIDER $nombre");
  }

  get getNombre => _nombre;
  get getPrecio => _precio;

  bool isValidForm() {
    print(formKey.currentState?.validate());

    return formKey.currentState?.validate() ?? false;
  }

  Future setTiendas() async {
    tiendas = await DB.getTiendas();
    _valorCombo = tiendas[0]['nombre'];
    //print("SET");
    //print(tiendas);
    notifyListeners();
  }

  List<Map<String, dynamic>> getTiendas() {
    return tiendas;
  }

  setValorCombo(String valor) {
    _valorCombo = valor;
    //notifyListeners();
  }

  getValorCombo() {
    return _valorCombo;
  }

  void grabarProducto(
      {required String nombre,
      required double precio,
      required int tienda}) async {
    String fecha =
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
    int res = await DB.crearProducto(nombre, precio, fecha, tienda);
    print(res);
  }
}
