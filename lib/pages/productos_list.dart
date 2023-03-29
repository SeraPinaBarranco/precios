import 'package:flutter/material.dart';
import 'package:precios/provider/productos_provider.dart';
import 'package:precios/ui/custom_drawer.dart';
import 'package:provider/provider.dart';

import '../themes/scaffold_text_style.dart';

class ProductosList extends StatelessWidget {
  const ProductosList({super.key});

  @override
  Widget build(BuildContext context) {
    final productosProvider = Provider.of<ProductosProvider>(context);
    productosProvider.cargarProductos();

    //final productos = productosProvider.getProductos;

    //print(productos);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Listado de tiendas 2"),
          titleTextStyle: scaffoldTheme,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        drawer: const CustomDrawer(),
        body: ListView.builder(
          itemCount: productosProvider.getProductos.length,
          itemBuilder: (context, index) {
            //TODO Construir list tile
            return const Text("data");
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
