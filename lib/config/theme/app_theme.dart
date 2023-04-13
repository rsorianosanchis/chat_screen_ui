import 'package:flutter/material.dart';

const Color _customColor = Color.fromRGBO(149, 65, 218, 1);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {

  final int selectedColor;

  AppTheme({this.selectedColor = 0}):
    assert (selectedColor < _colorThemes.length  && selectedColor >= 0, 'Colors value must be in a range between 0 and ${_colorThemes.length - 1}');
  // metodo de la clase que retorna una ThemeData que es lo que espera theme: de MaterialApp
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true, 
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.light
    );
  }
}
