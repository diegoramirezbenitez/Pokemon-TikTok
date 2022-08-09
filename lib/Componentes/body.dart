import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_tiktok/Componentes/lista.dart';


class pokemon_tiktok extends StatefulWidget {
  @override
  principal createState() => principal();
}

class principal  extends State<pokemon_tiktok> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

        home: Scaffold(
            body: ListView(
                children: <Widget>[
                  lista(),
                ]
            )

    )
    );
  }



}