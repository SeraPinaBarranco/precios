import 'package:flutter/material.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.lime.shade800),
            child: const Text(
              'Menú ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Container(
            height: 2400,
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                const ListTile(
                  title:
                      Text('Productos', style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  onTap: () => Navigator.pushReplacementNamed(context, 'productos'),
                  leading:
                      const Icon(Icons.add_circle_rounded, color: Colors.white),
                  title: const Text('Nuevo',
                      style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, 'listado_productos'),
                  leading: const Icon(Icons.format_list_bulleted,
                      color: Colors.white),
                  title: const Text('Listado',
                      style: TextStyle(color: Colors.white)),
                ),
                const ListTile(
                  title: Text('Tiendas', style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  onTap: () => Navigator.pushReplacementNamed(context, 'tienda'),
                  leading: const Icon(Icons.create_new_folder_sharp,
                      color: Colors.white),
                  title: const Text(
                    'Crear',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.pushReplacementNamed(context, 'tiendas'),
                  leading:
                      const Icon(Icons.shop_two_sharp, color: Colors.white),
                  title: const Text('Listar',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
