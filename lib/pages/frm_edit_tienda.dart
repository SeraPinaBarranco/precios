import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/tienda_provider.dart';
import '../themes/scaffold_text_style.dart';
import '../ui/custom_drawer.dart';
import '../ui/input_decorations.dart';

class FrmEditTienda extends StatelessWidget {
  const FrmEditTienda({super.key});

  @override
  Widget build(BuildContext context) {
    final TiendaProvider tiendaProvider =
        Provider.of<TiendaProvider>(context, listen: false);
    //tiendaProvider.cargarTienda(tiendaProvider.getIdTienda);
    final id = tiendaProvider.getIdTienda;
    print("update");
    print(tiendaProvider.getIdTienda);

    var t = tiendaProvider.getAllTiendas
        .where(
          (element) => element['id'] == id,
        )
        .toList();

    return Scaffold(
        drawer: const CustomDrawer(),
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          titleTextStyle: scaffoldTheme,
          title: Text("Editar Tienda ${tiendaProvider.getIdTienda}"),
          centerTitle: true,
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: tiendaProvider.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: t[0]['nombre'],
                  //onChanged: (value) => nombre = value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacio!";
                    }
                    return null;
                  },
                  decoration: InputDecorations.textFormFieldID(
                      hintText: "Nombre tienda", labelText: "Tienda:"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: t[0]['imagen'],
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    print(t[0]['nombre']);
                    //tiendaProvider.getTienda(tiendaProvider.getIdTienda);
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
