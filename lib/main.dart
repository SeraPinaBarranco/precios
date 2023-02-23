import 'package:flutter/material.dart';
import 'package:precios/pages/page2.dart';
import 'package:precios/pages/pagina_inicio.dart';
import 'package:precios/provider/my_provider.dart';
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
        ChangeNotifierProvider(create: (_) => MyProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'pagina_inicio',
        routes: {
          'pagina_inicio': (context) => const PaginaInicio(),
          'page2': (context) => const Page2()
        },
      ),
    );
  }
}
