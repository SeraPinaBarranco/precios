import 'package:flutter/material.dart';
import 'package:precios/model/tienda.dart';

import 'package:precios/provider/my_provider.dart';
import 'package:precios/themes/themes.dart';
import 'package:precios/ui/input_decorations.dart';
import 'package:provider/provider.dart';

import '../model/db.dart';

class FrmPRoductos extends StatefulWidget {
  const FrmPRoductos({super.key});

  @override
  State<FrmPRoductos> createState() => _FrmPRoductosState();
}

class _FrmPRoductosState extends State<FrmPRoductos> {
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _tiendas = [];

  List<String> nombreTiendas = [];

  List<String> t = [];
  String valorDrop = "";
  int indiceTienda = -1;

  String? nombre, tienda;
  int idTienda = -1;
  double precio = 0.0;

  void _cargarTiendas() async {
    final data = await DB.getTiendas();
    setState(() {
      _tiendas = data;
      for (var element in _tiendas) {
        t.add(element['nombre']);
      }
      valorDrop = t[0];
    });
  }

  _llenarNombreTiendas() {
    setState(() {
      for (var element in _tiendas) {
        t.add(element['nombre']);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _cargarTiendas();
  }

  @override
  Widget build(BuildContext context) {
    //final intProvider = Provider.of<MyProvider>(context);

    //t = _llenarNombreTiendas();

    String num = "";

    

    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            titleTextStyle: scaffoldTheme,
            title: const Text("Nuevo Producto"),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  //CAMPO NOMBRE
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "El campo no puede estar vacio!";
                        } else {
                          nombre = value;
                        }
                        return null;
                      },
                      decoration: InputDecorations.textFormFieldID(
                          hintText: "Nombre producto",
                          labelText: "Producto",
                          prefixIcon: Icons.production_quantity_limits)),

                  //CAMPO PRECIO
                  TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "El campo no puede estar vacio!";
                        } else {
                          precio = double.parse(value);
                        }
                        return null;
                      },
                      decoration: InputDecorations.textFormFieldID(
                          hintText: "Precio",
                          labelText: "Precio \$",
                          prefixIcon: Icons.monetization_on)),

                  //LISTADO TIENDAS
                  DropdownButton(
                    icon: const Icon(Icons.shopify),
                    hint: const Text("Tienda"),
                    value: valorDrop,
                    items: t.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        indiceTienda = t.indexOf(value ?? "");
                        print(indiceTienda);
                        idTienda = _tiendas[indiceTienda]['id'];

                        valorDrop = value ?? "";
                      });
                    },
                    style: const TextStyle(fontSize: 20, color: Colors.indigo),
                    isExpanded: true,
                  ),

                  //GUARDAR DATOS
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          const snackbar =
                              SnackBar(content: Text("Validando datos!!"));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);

                          //TODO Validar y mandar a base de datos
                          if (nombre != "" && tienda != "") {
                            print(_tiendas[indiceTienda]['id']);
                          }
                        }
                      });
                    },
                    style:
                        ElevatedButton.styleFrom(foregroundColor: colorBoton),
                    child: const Text("Submit"),
                  ),

                  Text(t.indexOf(valorDrop).toString()),

                  Text(indiceTienda == -1 ? "-1" : _tiendas[indiceTienda]['id'].toString()),
                  Text(indiceTienda.toString()),
                ],
              ),
            ),
          )),
    );
  }
}
