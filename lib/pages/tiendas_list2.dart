import 'package:flutter/material.dart';

import 'package:precios/provider/tienda_provider.dart';
import 'package:precios/themes/scaffold_text_style.dart';
import 'package:provider/provider.dart';

import '../ui/custom_drawer.dart';

class TiendasList2 extends StatelessWidget {
  const TiendasList2({super.key});

  @override
  Widget build(BuildContext context) {
    final TiendaProvider tiendasProvider = Provider.of<TiendaProvider>(context);
    tiendasProvider.cargasrTiendas();

    final tiendas = tiendasProvider.getAllTiendas;

    return Scaffold(
        drawer: const CustomDrawer(),
        floatingActionButton: const CustomDialog(),
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: const Text("Listado de tiendas 2"),
          titleTextStyle: scaffoldTheme,
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(tiendas.length, (index) {
            return Card(
                elevation: 0,
                color: Colors.lime[900],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      tiendas[index]['imagen'],
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                      errorBuilder: (context, error, stackTrace) {
                        //return const Text("ERRRO");
                        return Image.asset(
                          "assets/loading-jar.png",
                          width: 100,
                          height: 100,
                        );
                      },
                    ),
                    Center(
                      child: Text(tiendas[index]['nombre']),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          //* EDIT BUTTON
                          onPressed: () {
                            //tiendasProvider.cargarTienda(tiendas[index]['id']);
                            tiendasProvider.idT(tiendas[index]['id']);
                            
                            // tiendasProvider.idT(tiendas[index]['id']);
                            Navigator.pushReplacementNamed(
                                context, 'actualizar_tienda');
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          //* DELETE BUTTON
                          onLongPress: () => tiendasProvider
                              .borrarTienda(tiendas[index]['id']),
                          onPressed: () {},
                          child: IconButton(
                              onPressed: (() {}),
                              icon: const Icon(
                                Icons.delete_forever_outlined,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    )
                  ],
                ));
          }),
        ));
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TiendaProvider tiendasProvider = Provider.of<TiendaProvider>(context);

    return FloatingActionButton(
        onPressed: () => showDialog<String>(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.blue.shade100,
                title: const Text('Elimnar el listado?'),
                content: const Text('Se eliminarán todas las tiendas!!!'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () => {
                            tiendasProvider.borrarTodasTiendas(),
                            Navigator.pushReplacementNamed(
                                context, 'pagina_inicio')
                          },
                      child: const Text('OK')),
                ],
              ),
            ),
        child: const Icon(Icons.delete_forever));
  }
}
