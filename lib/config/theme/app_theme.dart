import 'package:flutter/material.dart';

class AppTheme{
  ThemeData getTheme(){
    const seedColor =Colors.deepPurple;
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      listTileTheme: const ListTileThemeData(
        tileColor: Colors.white, //TODO: dejar solo el color del icono si sale algun probelma 
        iconColor: seedColor,
        textColor: seedColor,
      ),
    );
  }
}