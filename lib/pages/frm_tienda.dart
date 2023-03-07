import 'package:flutter/material.dart';
import 'package:precios/model/db.dart';
import 'package:precios/model/tienda.dart';
import 'package:precios/provider/tienda_provider.dart';
import 'package:precios/ui/input_decorations.dart';
import 'package:provider/provider.dart';

import '../themes/themes.dart';

class FrmTienda extends StatefulWidget {
  const FrmTienda({super.key});

  @override
  State<FrmTienda> createState() => _FrmTiendaState();
}

class _FrmTiendaState extends State<FrmTienda> {
  final _formKey = GlobalKey<FormState>();
  String nombre = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          titleTextStyle: scaffoldTheme,
          title: const Text("Tienda"),
          centerTitle: true,
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //onChanged: (value) => nombre = value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacio!";
                    } else {
                      nombre = value;
                    }
                    return null;
                  },
                  decoration: InputDecorations.textFormFieldID(
                      hintText: "Nombre tienda", labelText: "Tienda:"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final snackbar = SnackBar(
                        content: const Text("Validando datos!!"),
                        duration: const Duration(seconds: 5),
                        backgroundColor: const Color.fromARGB(3, 233, 233, 153),
                        action: SnackBarAction(label: 'Ir al listado', onPressed: () => Navigator.pushNamed(context, 'tiendas'),)
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      ;
                      //TODO Validar y mandar a base de datos
                      if (nombre != "") {
                        DB.crearTienda(nombre);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(foregroundColor: colorBoton),
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ));
  }
}
