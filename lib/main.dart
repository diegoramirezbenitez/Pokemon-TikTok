import 'package:flutter/material.dart';
import 'package:pokemon_tiktok/Principal/favoritos.dart';

import 'Componentes/body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: pokemon_tiktok(),
    );
  }
}

