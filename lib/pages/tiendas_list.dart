import 'package:flutter/material.dart';
import 'package:precios/model/db.dart';
import 'package:precios/model/tienda.dart';

import 'package:precios/provider/tienda_provider.dart';
import 'package:provider/provider.dart';

import '../themes/themes.dart';

class TiendasList extends StatefulWidget {
  const TiendasList({super.key});

  @override
  State<TiendasList> createState() => _TiendasListState();
}

class _TiendasListState extends State<TiendasList> {
  List<Map<String, dynamic>> _tiendas = [];

  void _cargarTiendas() async {
    final data = await DB.getTiendas();
    setState(() {
      _tiendas = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _cargarTiendas();
    print("numero de tiendas ${_tiendas.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        titleTextStyle: scaffoldTheme,
        title: const Text("Listado de Tiendas"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _tiendas.length,
          itemBuilder: ((context, i) {
            return ListTile(
                leading: Icon(Icons.shopping_bag_outlined,
                    color: (i % 2) == 0 ? Colors.white : Colors.white30),
                title: Text(
                  _tiendas[i]['nombre'],
                  style: const TextStyle(color: Colors.white),
                ));
            
          })),
    );
  }
}
