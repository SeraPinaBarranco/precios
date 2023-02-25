import 'package:flutter/material.dart';
import 'package:precios/pages/page2.dart';
import 'package:precios/themes/scaffold_text_style.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
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
                  onPressed: () => Navigator.pushNamed(context, 'page2'),
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
                  child: const Text("Nuevo producto"),
                ),

                const Text("INICIO"),
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