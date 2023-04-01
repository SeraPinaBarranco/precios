import 'package:flutter/material.dart';

import 'package:precios/provider/productos_provider.dart';
import 'package:precios/ui/custom_drawer.dart';
import 'package:precios/ui/input_decorations.dart';
import 'package:provider/provider.dart';

import '../themes/scaffold_text_style.dart';

final lista = [
  'Pollo',
  'Ternera',
  'Cerdo',
  'Conejo',
  'Verduras',
  'Pescado',
  'Yogures',
  'Leche',
  'Envasados'
];

class FrmProductos2 extends StatelessWidget {
  const FrmProductos2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const CustomDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        titleTextStyle: scaffoldTheme,
        title: const Text("Nuevo Producto 2"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
          create: (_) {
            ProductosProvider();
          },
          child: const ProductsForm()),
    );
  }
}

class ProductsForm extends StatefulWidget {
  const ProductsForm({super.key});

  @override
  State<ProductsForm> createState() => _ProductsFormState();
}

class _ProductsFormState extends State<ProductsForm> {
  @override
  Widget build(BuildContext context) {
    final c = [...lista];

    final formProvider = Provider.of<ProductosProvider>(context);
    String nombre = "";
    String precio = "";

    formProvider.setTiendas();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formProvider.formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //*CAMPO NOMBRE
              TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  autovalidateMode: AutovalidateMode.always,
                  onChanged: (value) => formProvider.setNombre(value.trim()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacio!";
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) => print(value),
                  decoration: InputDecorations.textFormFieldID(
                      hintText: "Nombre producto",
                      labelText: "Producto",
                      prefixIcon: Icons.production_quantity_limits)),

              //*CAMPO PRECIO
              TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  onChanged: (value) => value.isNotEmpty
                      ? formProvider.setPrecio(double.parse(value))
                      : 0.0,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty || double.parse(value) <= 0) {
                      return "El campo no puede estar vacio o ser 0!";
                    }
                    return formProvider.setPrecio(double.parse(value));
                  },
                  decoration: InputDecorations.textFormFieldID(
                      hintText: "Precio",
                      labelText: "Precio \$",
                      prefixIcon: Icons.monetization_on)),

              const SizedBox(
                height: 20,
              ),

              //LISTADO TIENDAS
              DropdownButtonFormField(
                onChanged: (value) {
                  formProvider.setValorCombo(value.toString());
                  formProvider.valorCombo = value.toString();
                  //print(formProvider.getValorCombo());
                },
                items: formProvider.getTiendas().map((e) {
                  return DropdownMenuItem(
                      value: e['id'] ?? -1, child: Text(e['nombre']));
                }).toList(),
              ),

              const SizedBox(
                height: 20,
              ),

              //LISTADO CATEGORIAS
              DropdownButtonFormField(
                onChanged: (value) {
                  formProvider.setCategoria(value ?? "Sin categoria");
                },
                items: c.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () async {
                  if (formProvider.isValidForm()) {
                    final resp = await formProvider.grabarProducto(
                        nombre: formProvider.getNombre,
                        precio: formProvider.getPrecio,
                        categoria: formProvider.getCategoria,
                        tienda: int.parse(formProvider.valorCombo));
                    //if (resp == 1) {
                    formProvider.setNombre("");

                    formProvider.formKey.currentState!.reset();
                    //}
                  } else {
                    return;
                  }
                },
                style: ElevatedButton.styleFrom(foregroundColor: colorBoton),
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
