import 'package:flutter/material.dart';
import 'package:pinterest_layout_menu_flutter_app/providers/menu_provider.dart';
import 'package:provider/provider.dart';

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
      // children: items.map((item) => _MenuButton(item: item)).toList(),

      // Por cada item en el listado de opciones de menú, generar un IconButton
      // Este deberá mostrar el icono y ejecitar el callback deinido para ese item,
      // Para saber si la opción de menu esta actualmente seleccionada, es necesaria la posición que ocupa ese elemento en la lista
      // Opción 1
      // children: items.asMap().map((index, item) => MapEntry(index, _MenuButton(item: item, index: index))).values.toList(),
      // Opción 2
      children: List.generate(items.length,
          (index) => _MenuButton(item: items[index], index: index)),
    );
  }
}

// Widget privado que define un botón como opción del menú
class _MenuButton extends StatelessWidget {
  const _MenuButton({
    super.key,
    required this.item,
    required this.index,
  });
  final PinterestButton item;
  final int index;

  @override
  Widget build(BuildContext context) {
    // Solicitar la instancia del MenuProvider
    final menuProvider = Provider.of<MenuProvider>(context);

    return IconButton(
        onPressed: () {
          // Especificar el nuevo elemento de menú seleccionado
          menuProvider.selectedItem = index;
          // Ejecutar el callback o tareas para esa opción de mení
          item.callback();
        },
        icon: Icon(
          item.icon,
          // Cambiar el color y tamaño del icono en base a si está actualmente seleccionado
          size: menuProvider.selectedItem == index ? 35 : 25,
          color: menuProvider.selectedItem == index
              ? Colors.black
              : Colors.blueGrey,
        ));
  }
}
