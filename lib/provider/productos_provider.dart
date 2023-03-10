import 'package:flutter/material.dart';
import 'package:precios/model/db.dart';

class ProductosProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> tiendas = [];

  String valorCombo = "";

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
    valorCombo = tiendas[0]['nombre'];
    print("SET");
    print(tiendas);
    //notifyListeners();
  }

  List<Map<String, dynamic>> getTiendas() {
    return tiendas;
  }
}
