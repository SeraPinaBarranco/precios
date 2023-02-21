import 'package:flutter/material.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        color: Colors.red,
        child: Column(        
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text("INICIO"),
          ],
        ),
      ),
      appBar:AppBar(
      title: const Text("Pagina de inicio"),
      centerTitle: true,

    ),);
  }
}