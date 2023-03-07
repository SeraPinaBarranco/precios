import 'package:flutter/material.dart';
import 'package:precios/themes/scaffold_text_style.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        
        
        child: Row(        
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, 'productos'),
                  style: ElevatedButton.styleFrom(foregroundColor: const Color.fromARGB(255, 165, 156, 156)),
                  child: const Text("Nuevo producto"),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, 'tienda'),
                  style: ElevatedButton.styleFrom(foregroundColor: const Color.fromARGB(255, 165, 156, 156)),
                  child: const Text("Nuevo tienda"),
                ),

                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, 'tiendas'),
                  style: ElevatedButton.styleFrom(foregroundColor: const Color.fromARGB(255, 165, 156, 156)),
                  child: const Text("Listado de tiendas"),
                ),
                
              ],
            ),  
          ],
        ),
      ),
      appBar:AppBar(
        title: const Text("Pagina de inicio"),
        centerTitle: true,
        titleTextStyle: scaffoldTheme,

      ),
    );
  }

  
}