import 'package:flutter/material.dart';
import 'package:precios/pages/pagina_inicio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'pagina_inicio',
      routes: {
        'pagina_inicio': (context) => const PaginaInicio(),
        
      },
      
    );
  }
}
