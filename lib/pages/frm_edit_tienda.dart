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

    List<Map<String, dynamic>> t = tiendaProvider.cargatTienda2(id);

    tiendaProvider.setNombreTienda = "";
    tiendaProvider.setNombreImagen = "";
    tiendaProvider.isEditN(false);
    tiendaProvider.isEditI(false);

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
                  onChanged: (value) {
                    value.isEmpty
                        ? tiendaProvider.isEditN(false)
                        : tiendaProvider.isEditN(true);
                    tiendaProvider.setNombreTienda = value.toUpperCase().trim();
                  },
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
                  onChanged: (value) {
                    value.isEmpty
                        ? tiendaProvider.isEditI(false)
                        : tiendaProvider.isEditI(true);
                    tiendaProvider.setNombreImagen = value.trim();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    /* Si el nombre no está cambiado poner el nombre de initialValue */
                    if (!tiendaProvider.getIsEditNombre) {
                      tiendaProvider.setNombreTienda = t[0]['nombre'];
                    }
                    /* Si la imagen no está cambiado poner el nombre de initialValue */
                    if (!tiendaProvider.getIsEditImagen) {
                      tiendaProvider.setNombreImagen = t[0]['imagen'];
                    }

                    // TODO ACTUALIZAR TIENDA
                    tiendaProvider.updateTienda(t[0]['id'],
                        tiendaProvider.getNombre, tiendaProvider.getImagen);


                    tiendaProvider.isEditN(false);
                    tiendaProvider.isEditI(false);
                    // VOLVER AL LISTADO
                    Navigator.pushReplacementNamed(context, 'tiendas');
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
