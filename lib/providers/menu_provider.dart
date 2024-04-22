import 'package:flutter/material.dart';

// Provider encargado de adminstrar el estado del menú de la aplicación
class MenuProvider extends ChangeNotifier {
  int _selectedItem = 0;

  int get selectedItem => _selectedItem;
  set selectedItem(int index) {
    _selectedItem = index;
    notifyListeners();
  }
}
