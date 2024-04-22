import 'package:flutter/material.dart';

// Provider encargado de adminstrar el estado del menú de la aplicación
class MenuProvider extends ChangeNotifier {
  int _selectedItem = 0;
  bool _showMenu = true;
  Color activeColor;
  Color deactiveColor;

  MenuProvider({required this.activeColor, required this.deactiveColor});

  int get selectedItem => _selectedItem;
  set selectedItem(int index) {
    _selectedItem = index;
    notifyListeners();
  }

  bool get showMenu => _showMenu;
  set showMenu(bool isShow) {
    _showMenu = isShow;
    notifyListeners();
  }
}
