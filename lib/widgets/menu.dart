import 'package:flutter/material.dart';

// Clase de utilidad para definir o modelar la información que debe contener un botón correspondiente al menú
class PinterestButton {
  final IconData icon;
  final Function callback;

  PinterestButton({required this.icon, required this.callback});
}

// Widget que representa el menú flotante de mi aplicación
class Menu extends StatelessWidget {
  Menu({super.key});

  // Lista de opciones disponibles en el menú
  final List<PinterestButton> items = [
    PinterestButton(
      icon: Icons.pie_chart,
      callback: () {
        print('Icon Pie Chart');
      },
    ),
    PinterestButton(
      icon: Icons.search,
      callback: () {
        print('Icon Search');
      },
    ),
    PinterestButton(
      icon: Icons.notifications,
      callback: () {
        print('Icon Notifications');
      },
    ),
    PinterestButton(
      icon: Icons.supervised_user_circle,
      callback: () {
        print('Icon Supervise User Circle');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // Definir las dimensiones del contenedor del menu
        width: 220,
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        decoration: decorationMenu(),
        child: _MenuItems(items: items),
      ),
    );
  }

  // Método encargado de estableer la decoración del menú
  BoxDecoration decorationMenu() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      // Sombra
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          offset: const Offset(0, 0),
          blurRadius: 10,
          // Aplicar efecto de iluminación en lugar de una sombra proyectada
          // spreadRadius define la distancia a la que se extiende la sombra desde el objeto en todas las direcciones.
          spreadRadius: -3,
        ),
      ],
    );
  }
}

// Widget privado encargado de definir el espacio u orientación de los elementos del menú
class _MenuItems extends StatelessWidget {
  const _MenuItems({
    super.key,
    required this.items,
  });

  final List<PinterestButton> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // Por cada item en el listado de opciones de menú, generar un IconButton con el icono y callback deinido para ese item
      children: items.map((item) => _MenuButton(item: item)).toList(),
    );
  }
}

// Widget privado que define un botón como opción del menú
class _MenuButton extends StatelessWidget {
  const _MenuButton({
    super.key,
    required this.item,
  });
  final PinterestButton item;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => item.callback(),
        icon: Icon(
          item.icon,
          color: Colors.blueGrey,
        ));
  }
}
