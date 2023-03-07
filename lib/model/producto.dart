import 'package:precios/model/tienda.dart';

class Producto {
  final int? id;
  final String nombre;
  final List<Tienda> tienda;

  const Producto({this.id, required this.nombre, required this.tienda});

  get getNombre => nombre;
  List<Tienda> get getTienda => tienda;

  set nombre(String val) {
    nombre = val;
  }

  // set tienda(Tienda val) {
  //   tienda = val;
  // }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'tienda': tienda,
    };
  }
}
