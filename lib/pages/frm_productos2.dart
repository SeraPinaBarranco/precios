import 'dart:async';

import 'package:flutter/material.dart';
import 'package:precios/provider/productos_provider.dart';
import 'package:precios/ui/input_decorations.dart';
import 'package:provider/provider.dart';

import '../themes/scaffold_text_style.dart';

class FrmProductos2 extends StatelessWidget {
  const FrmProductos2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: ProductsForm()),
    );
  }
}

class ProductsForm extends StatelessWidget {
  const ProductsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<ProductosProvider>(context);

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
                  autovalidateMode: AutovalidateMode.always,
                  onChanged: (value) => formProvider.setNombre(value),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacio!";
                    }
                    return null;
                  },
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

              //LISTADO TIENDAS
              DropdownButtonFormField(
                onChanged: (value) {
                  formProvider.setValorCombo(value.toString());
                  formProvider.valorCombo = value.toString();
                  print(formProvider.getValorCombo());
                },
                items: formProvider.getTiendas().map((e) {
                  return DropdownMenuItem(
                      value: e['id'], child: Text(e['nombre']));
                }).toList(),
              ),

              //LISTADO TIENDAS
              /*DropdownButton(
                onChanged: (value) {
                  formProvider.setValorCombo(value);
                  //print(formProvider.valorCombo);
                },
                icon: const Icon(Icons.shopify),
                hint: const Text("Tienda"),
                // ignore: unnecessary_null_comparison
                value: formProvider.getValorCombo(),
                items: formProvider.getTiendas().map<DropdownMenuItem>((e) {
                  return DropdownMenuItem(
                      value: e['nombre'], child: Text(e['nombre']));
                }).toList(),

                style: const TextStyle(fontSize: 20, color: Colors.indigo),
                isExpanded: true,
              ),*/

              //Text(formProvider.tiendas[2]['nombre']),

              ElevatedButton(
                onPressed: () {
                  if (formProvider.isValidForm()) {
                    //print("Guardar en BBDD");
                    //print(formProvider.tiendas);
                    //for (var i = 0; i < formProvider.tiendas.length; i++) {
                    //  print(formProvider.tiendas[i]['nombre']);
                    //}
                    //print("${formProvider.valorCombo} - ${formProvider.getNombre} - ${formProvider.getPrecio} ");
                    formProvider.grabarProducto(nombre: formProvider.getNombre, precio: formProvider.getPrecio, tienda: int.parse(formProvider.valorCombo));
                    // formProvider.tiendas.map((tienda) =>
                    //   print(tienda)
                    // ).toList();
                    //Timer(const Duration(seconds: 3), ()=> Navigator.pushReplacementNamed(context, 'tiendas'));
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
