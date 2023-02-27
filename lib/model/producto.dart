class Producto {
  final int id;
  final String nombre;
  final String tienda;

  const Producto({required this.id, required this.nombre, required this.tienda});

  get getNombre => nombre;
  get getTienda => tienda;

  set nombre(String val) {
    nombre = val;
  }

  set tienda(String val) {
    tienda = val;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'tienda': tienda,
    };
  }
}
