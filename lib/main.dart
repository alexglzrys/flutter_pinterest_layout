import 'package:flutter/material.dart';
import 'package:pinterest_layout_menu_flutter_app/screens/home_screen.dart';

void main() => runApp(const PinterestLayoutMenuApp());

class PinterestLayoutMenuApp extends StatelessWidget {
  const PinterestLayoutMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pinterest Layout Menu',
      home: HomeScreen(),
    );
  }
}
