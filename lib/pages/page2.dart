import 'package:flutter/material.dart';
import 'package:precios/model/producto.dart';
import 'package:precios/provider/my_provider.dart';
import 'package:precios/themes/themes.dart';
import 'package:precios/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final intProvider = Provider.of<MyProvider>(context);
    String num = "";

    String? nombre, tienda;

    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            titleTextStyle: scaffoldTheme,
            title: const Text("Pagina 2"),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "El campo no puede estar vacio!";
                        }
                        nombre = value;
                      },
                      decoration: InputDecorations.textFormFieldID(
                          hintText: "Nombre producto",
                          labelText: "Producto",
                          prefixIcon: Icons.production_quantity_limits)),

                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "El campo no puede estar vacio!";
                        }
                        tienda = value;
                      },
                      decoration: InputDecorations.textFormFieldID(
                          hintText: "Tienda",
                          labelText: "Tienda",
                          prefixIcon: Icons.shopify_outlined)),
                          
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        const snackbar =
                            SnackBar(content: Text("Validando datos!!"));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);

                        //TODO Validar y mandar a base de datos
                        if (nombre != "" && tienda != "") {
                          Producto prod =
                              Producto(nombre: nombre!, tienda: tienda!);
                          print(prod.getTienda);
                        }
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(foregroundColor: colorBoton),
                    child: const Text("Submit"),
                  ),
                  Text(num.toString()),
                ],
              ),
            ),
          )),
    );
  }
}
