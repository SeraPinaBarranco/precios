import 'package:flutter/material.dart';
import 'package:precios/themes/scaffold_text_style.dart';

import '../ui/custom_drawer.dart';

//import '../ui/custom_floating_action_button.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const CustomDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //?BOTONES NUEVOS
                

                const Divider(
                  height: 5,
                  thickness: 4,
                  color: Color.fromARGB(4, 44, 44, 44),
                ),

                FloatingActionButton.large(
                  onPressed: () =>
                      Navigator.pushNamed(context, 'listado_productos'),
                  child: const Text(
                    'Lista productos',
                    textAlign: TextAlign.center,
                  ),
                ),

                //!BOTONES BASICOS
                // ElevatedButton(
                //   onPressed: () => Navigator.pushNamed(context, 'productos'),
                //   style: ElevatedButton.styleFrom(foregroundColor: const Color.fromARGB(255, 165, 156, 156)),
                //   child: const Text("Nuevo producto"),
                // ),

                // ElevatedButton(
                //   onPressed: () => Navigator.pushNamed(context, ''),
                //   style: ElevatedButton.styleFrom(foregroundColor: const Color.fromARGB(255, 165, 156, 156)),
                //   child: const Text("Nuevo tienda"),
                // ),

                // ElevatedButton(
                //   onPressed: () => Navigator.pushNamed(context, ''),
                //   style: ElevatedButton.styleFrom(foregroundColor: const Color.fromARGB(255, 165, 156, 156)),
                //   child: const Text("Listado de tiendas"),
                // ),

                // ElevatedButton(
                //   onPressed: () => Navigator.pushNamed(context, 'listado_productos'),
                //   style: ElevatedButton.styleFrom(foregroundColor: const Color.fromARGB(255, 165, 156, 156)),
                //   child: const Text("Listado de productos"),
                // ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Pagina de inicio"),
        centerTitle: true,
        titleTextStyle: scaffoldTheme,
      ),
    );
  }
}

