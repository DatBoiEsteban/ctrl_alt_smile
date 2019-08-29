import 'package:flutter/material.dart';
import 'consts.dart';
import 'SelecionImagen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ctrl_alt_smile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: COLOR_PRIMARIO,
      ),
      home: VistaImagen(title: TITULO),
    );
  }
}
