import 'package:flutter/material.dart';
import 'package:precios/provider/my_provider.dart';
import 'package:precios/themes/scaffold_text_style.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final intProvider = Provider.of<MyProvider>(context);
    final num = intProvider.getNumero;
    return Scaffold(
        appBar: AppBar(
          titleTextStyle: scaffoldTheme,
          title: const Text("Pagina 2"),
          centerTitle: true,
        ),
        
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => {intProvider.setNumero(),},
                  child: const Text("+1")),
              Text(num.toString()),
            ],
          ),
        ));
  }
}
