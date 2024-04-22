import 'package:flutter/material.dart';
import 'package:pinterest_layout_menu_flutter_app/providers/menu_provider.dart';
import 'package:pinterest_layout_menu_flutter_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const PinterestLayoutMenuApp());

class PinterestLayoutMenuApp extends StatelessWidget {
  const PinterestLayoutMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilizar Provider para adminsitrar el estado global de la aplicacion
    return ChangeNotifierProvider(
      create: (_) =>
          MenuProvider(activeColor: Colors.red, deactiveColor: Colors.blueGrey),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pinterest Layout Menu',
        home: HomeScreen(),
      ),
    );
  }
}
