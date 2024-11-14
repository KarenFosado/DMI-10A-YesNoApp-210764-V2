import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 21, 158, 3);

const List<Color> _colorThemes = [
  _customColor,
  Colors.pink,
  Color.fromARGB(255, 111, 54, 244),
  Color.fromARGB(255, 21, 3, 101),
  Colors.blue,
  Colors.purple,
  Colors.orange,
  Colors.yellow,
];

class AppTheme {

  final int selectedColor;

  AppTheme({this.selectedColor =1}): 
    assert(selectedColor >= 0 && selectedColor <= _colorThemes.length -1, 
    'Colors must be between 0 and ${_colorThemes.length}');


  ThemeData theme(){
    return ThemeData( 
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }
}