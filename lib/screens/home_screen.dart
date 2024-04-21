import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Listado de elementos a mostrar en el grid tipo Pinterest
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Desarrollo con Dart',
        'subtitle': 'Domina los fundamentos de este lenguaje de programación',
        'image': 'assets/images/01.jpg'
      },
      {
        'title': 'MySQL',
        'subtitle': 'El motor de base de datos de la web',
        'image': 'assets/images/02.jpg'
      },
      {
        'title': 'Aplicaciones en Flutter',
        'subtitle':
            'Desarrolle aplicaciones móviles robustas con el SDK de Flutter',
        'image': 'assets/images/03.jpg'
      },
      {
        'title': 'Programación con JavaScript',
        'subtitle': 'Programación del lado del navegador',
        'image': 'assets/images/04.jpg'
      },
      {
        'title': 'Lenguaje Java',
        'subtitle': 'Desarrollo multiplataforma',
        'image': 'assets/images/05.jpg'
      },
      {
        'title': 'HTML 5',
        'subtitle':
            'Desarrolle sitios Web semánticos con las nuevas etiquetas de HTML 5',
        'image': 'assets/images/06.jpg'
      },
      {
        'title': 'Diseños con CSS',
        'subtitle': 'Aprenda CSS como si estuviera en primero',
        'image': 'assets/images/07.jpg'
      },
      {
        'title': 'Bases de Datos',
        'subtitle':
            'Aprenda la diferencia entre bases de datos relacionales y no relacionales',
        'image': 'assets/images/08.jpg'
      },
      {
        'title': 'Ecosistema de NodeJS',
        'subtitle': 'JavaScript del lado del servidor',
        'image': 'assets/images/09.jpg'
      },
      {
        'title': 'Frameworks de JavaScript',
        'subtitle': 'Aprenda React, Angular y VUE ',
        'image': 'assets/images/10.jpg'
      },
      {
        'title': 'Desarrollo Frontend con Angular',
        'subtitle': 'Gestione grandes cantidades de datos con este Framework',
        'image': 'assets/images/11.jpg'
      },
      {
        'title': 'Componentes en React',
        'subtitle': 'Desarrolle aplicaciones Web basadas en componentes',
        'image': 'assets/images/12.jpg'
      },
      {
        'title': 'Gestión de Estado con Redux',
        'subtitle':
            'Gestión de grandes cantidades de datos en aplicaciones modernas',
        'image': 'assets/images/13.jpg'
      },
      {
        'title': 'Aplicaciones Progresivas',
        'subtitle': 'Sitios Web como aplicaciones de escritorio',
        'image': 'assets/images/14.jpg'
      },
      {
        'title': 'Desarrollo con PHP',
        'subtitle': 'El lenguaje número 1 del Internet',
        'image': 'assets/images/15.jpg'
      },
      {
        'title': 'Bases de Datos no Relacionales',
        'subtitle': 'Aprenda MongoDB y Firebase',
        'image': 'assets/images/16.jpg'
      },
      {
        'title': 'MongoDB y Firebase',
        'subtitle':
            'Administre su información con enfoque basado en colecciones y documentos',
        'image': 'assets/images/17.jpg'
      },
      {
        'title': 'Responsive Web Design',
        'subtitle': 'Desarrolle sitios Web con diseño adaptable',
        'image': 'assets/images/18.jpg'
      },
      {
        'title': 'Python',
        'subtitle': 'El lengiuaje de programación número 1 en cálculo de datos',
        'image': 'assets/images/19.jpg'
      },
    ];

    return Scaffold(
        body: SafeArea(
      // El contenido a mostrar en la pantalla debe ser scroleable
      child: SingleChildScrollView(
        // Animación al llegar al inicio o final del listado (igual que iOS)
        physics: const BouncingScrollPhysics(),
        child: PinterestGrid(items),
      ),
    ));
  }
}

// Widget que hace uso del plugin de terceros "flutter_staggered_grid_view" para mostrar un layout tipo Pinterest
class PinterestGrid extends StatelessWidget {
  const PinterestGrid(this.items, {super.key});
  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      // El eje principal por defecto en el StaggeredGrid es el eje Vertical (Arriba hacia Abajo)
      // Número de columnas
      crossAxisCount: 2,
      // Separación entre columnas
      crossAxisSpacing: 12,
      // Separación entre filas
      mainAxisSpacing: 8,
      //children: List.generate(31, (index) => _PinterestItem(index)),
      children: List.generate(items.length,
          (index) => _PinterestItem(index: index, value: items[index])),
    );
  }
}

// Widget privado que representa un item en el layout tipo Pinterest
class _PinterestItem extends StatelessWidget {
  const _PinterestItem({super.key, required this.index, required this.value});
  final int index;
  final Map<String, dynamic> value;

  @override
  Widget build(BuildContext context) {
    // El grid se ha configurado de 2 columnas por x filas
    return StaggeredGridTile.count(
      // Número de celdas a ocupar en el eje principal por este item
      crossAxisCellCount: 1,
      // Número de celdas a ocupar en el eje secundario por este item (si es par ocupa 2 )
      mainAxisCellCount: index.isEven ? 1 : 2,
      child: _Card(content: value),
    );
  }
}

// Widget privado que representa el contenido principal en cada uno de los cajones o espacios del Layout Pinterest
class _Card extends StatelessWidget {
  const _Card({
    super.key,
    required this.content,
  });

  final Map<String, dynamic> content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Imagen (ocupará todo el espacio disponible)
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              content['image'],
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Contenido descriptivo
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                content['subtitle'],
                style: const TextStyle(
                  fontSize: 11,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
