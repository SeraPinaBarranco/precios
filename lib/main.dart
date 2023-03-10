import 'package:flutter/material.dart';
import 'package:precios/pages/frm_productos2.dart';
import 'package:precios/pages/frm_products.dart';
import 'package:precios/pages/frm_tienda.dart';
import 'package:precios/pages/pagina_inicio.dart';
import 'package:precios/pages/tiendas_list.dart';
import 'package:precios/provider/my_provider.dart';
import 'package:precios/provider/productos_provider.dart';
import 'package:precios/provider/tienda_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
        ChangeNotifierProvider(create: (_)=> TiendaProvider()),
        ChangeNotifierProvider(create: (_)=> ProductosProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'pagina_inicio',
        routes: {
          'pagina_inicio': (_) => const PaginaInicio(),
          'productos': (_) => const FrmProductos2(),
          'tienda': (_) => const FrmTienda(),
          'tiendas': (_) => const TiendasList()
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.lime,
              backgroundColor: const Color.fromARGB(255, 85, 78, 78),
              accentColor: Colors.blue,
              cardColor: const Color.fromARGB(255, 215, 33, 243)),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ),
    );
  }
}
