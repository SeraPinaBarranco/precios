import 'package:flutter/material.dart';
import 'package:precios/model/db.dart';

class ProductosProvider extends ChangeNotifier {
  //final db = DB.db();
  ProductosProvider() {
    cargarProductos();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> tiendas = [];
  List<Map<String, dynamic>> productosList = [];

  String valorCombo = "";
  String _valorCombo = "";

  String _nombre = "";
  double _precio = 0;
  String _categoria = "";

  get getNombre => _nombre;
  get getPrecio => _precio;
  get getCategoria => _categoria;

  setCategoria(String c) {
    _categoria = c;
  }

  List<Map<String, dynamic>> get getProductos {
    print(productosList);
    return productosList;
  }

  initialValueNombre() {}

  setNombre(String nombreProducto) {
    _nombre = nombreProducto;
    //notifyListeners();
    //print("PROVIDER $nombre");
  }

  setPrecio(double precioProducto) {
    _precio = precioProducto;

    //print("PROVIDER $nombre");
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future setTiendas() async {
    tiendas = await DB.getTiendas();

    tiendas.isNotEmpty ? _valorCombo = tiendas[0]['nombre'] : _valorCombo = "";
    //_valorCombo = tiendas[0]['nombre'] ?? "";
    //print("SET");
    //print(tiendas);
    notifyListeners();
  }

  cargarProductos() async {
    final p = await DB.getProductos();
    productosList = p;

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

  Future<int> grabarProducto(
      {required String nombre,
      required double precio,
      String? categoria,
      required int tienda}) async {
    String fecha =
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
    int res = await DB.crearProducto(nombre, precio, fecha, categoria, tienda);
    cargarProductos();
    return res;
  }
}
