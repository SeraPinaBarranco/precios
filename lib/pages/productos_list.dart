import 'package:flutter/material.dart';
import 'package:precios/provider/productos_provider.dart';
import 'package:precios/ui/custom_drawer.dart';
import 'package:provider/provider.dart';

import '../themes/scaffold_text_style.dart';

class ProductosList extends StatelessWidget {
  const ProductosList({super.key});

  @override
  Widget build(BuildContext context) {
    final productosProvider =
        Provider.of<ProductosProvider>(context);
    //productosProvider.cargarProductos();

    List<Map<String, dynamic>> productos = Provider.of<ProductosProvider>(context, listen: true).getProductos;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Listado de productos"),
          titleTextStyle: scaffoldTheme,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        drawer: const CustomDrawer(),

        body: ListView.builder(
          itemCount: productosProvider.getProductos.length,
          itemBuilder: (context, index) {
            
            //TODO Construir Dismissible
            return Dismissible(
              background: Container(color: Colors.lime.shade400),
              key: ValueKey(productos[index]),
                child: ListTile(
                  title: Text(productos[index]['nombre']),
                  subtitle: Text(productos[index]['precio'].toString()),
                  leading: Text(productos[index]['categoria'] ?? "" ),
              ),
              onDismissed: (direction) => print(productos[index]['id']),
              );
          },
        ),


        floatingActionButton: ElevatedButton(
          onPressed: () {
            print(productosProvider.getProductos);
          },
          child: const Text("EE"),
        ));
  }
}
