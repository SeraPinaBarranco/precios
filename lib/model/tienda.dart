import 'dart:convert';

Tienda scanModelFromJson(String str) => Tienda.fromJson(json.decode(str));

String scanModelToJson(Tienda data) => json.encode(data.toMap());

class Tienda {
  Tienda({
    this.id,
    required this.nombre,
    String? imagen,
  });

  int? id;
  String nombre;
  String? imagen;
  
  factory Tienda.fromJson(Map<String, dynamic> json) =>
      Tienda(id: json["id"], nombre: json["nombre"], imagen: json["imagen"]);

  Map<String, dynamic> toMap() =>
      {"id": id, "nombre": nombre, "imagen": imagen};
}
