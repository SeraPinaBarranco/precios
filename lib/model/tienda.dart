import 'dart:convert';

Tienda scanModelFromJson(String str) => Tienda.fromJson(json.decode(str));

String scanModelToJson(Tienda data) => json.encode(data.toMap());

class Tienda {
    Tienda({
        this.id,
        required this.nombre,
    });

    int? id;
    String nombre;

    factory Tienda.fromJson(Map<String, dynamic> json) => Tienda(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
    };
}
