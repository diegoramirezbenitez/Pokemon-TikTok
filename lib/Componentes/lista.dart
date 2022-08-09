import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokemon_tiktok/Componentes/Pokemones.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_tiktok/Principal/favoritos.dart';
import 'package:pokemon_tiktok/guardado/nota.dart';
import 'package:pokemon_tiktok/guardado/opcion_database.dart';



final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];


class lista extends  StatefulWidget{
  @override
  categoria createState() => categoria();
}

class categoria extends State<lista>{

  List<nota_pokemon> filtro = <nota_pokemon>[];
  ScrollController listScrollController = ScrollController();
  List<Property> version = <Property>[];
  double widthSize = 0;
  double heightSize = 0;
  int recorrido = 1;



  Future<List<nota_pokemon>> pokemon() async {


    var url = 'https://pokeapi.co/api/v2/pokemon';
    var response = await http.get(Uri.parse(url));

    var nota = <nota_pokemon>[];

    if (response.statusCode == 200) {
      String variable = utf8.decode(response.bodyBytes);
      var notesJson = json.decode(variable);
      print(notesJson['results']);
     for (var noteJson1 in notesJson['results']) {
        nota.add(nota_pokemon.fromJson(noteJson1));

      }
    }
    return nota;
  }



  @override
  void initState() {
    pokemon().then((value) {
        setState(() {
          filtro.addAll(value);
        });

    });

    //}
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    widthSize = MediaQuery.of(context).size.width;
    heightSize = MediaQuery.of(context).size.height;
    return Container(
        width: widthSize,
        height: heightSize,
        child: ListView.builder(
          //padding: EdgeInsets.all(30.0),
            itemCount: filtro.length,
            itemBuilder: (context, index) {

              return  Container(
                  color:  _lightColors[filtro[index].indices % _lightColors.length],
                  child: Column(

                  children: <Widget>[
                    SizedBox(height: 30,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Mis favoritos',
                            style: TextStyle(fontSize: 15,color: Colors.white),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_reaction  ),
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => favoritos()),
                              );
                            },)
                        ]
                    ),
                    SizedBox(height: 20,),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              Text('Pokemon nro '+ filtro[index].indices.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins-Bold",
                                      fontSize: 12)),
                              SizedBox(height: 13,),
                              Text(filtro[index].nombre,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins-Bold",
                                      fontSize: 25)),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 5,
                              ),

                            ]
                        )
                    ),



                    Container(

                      margin: EdgeInsets.all(40),
                      //    padding: EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 30),
                      height: heightSize/2.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                              bottomRight: Radius.circular(24),
                              bottomLeft: Radius.circular(24)
                          )
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          //   Padding(
                          Positioned(
                              top:  -180,
                              child: Image.network(filtro[index].url_imagen,fit: BoxFit.fill, width: 300)
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5.0,top: 70,right: 5.0,bottom: 5.0),
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Container(
                                    height: 60,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: _lightColors[1],
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)
                                      ),
                                    ),
                                    child: Center(
                                      child:
                                      Text('Attack',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 15)),)
                                ),
                                Container(
                                    height: 60,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black38),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)
                                      ),
                                    ),
                                    child: Center(
                                      child:
                                      Text('49',
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 15)),)
                                ),
                                SizedBox(width: 30,),
                                Container(
                                    height: 60,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: _lightColors[1],
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)
                                      ),
                                    ),
                                    child: Center(
                                      child:
                                      Text('Defense',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 15)),)
                                ),
                                Container(
                                    height: 60,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black38),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)
                                      ),
                                    ),
                                    child: Center(
                                      child:
                                      Text('45',
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 15)),)
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5.0,top: 170,right: 5.0,bottom: 5.0),
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Container(
                                    height: 60,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: _lightColors[1],
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)
                                      ),
                                    ),
                                    child: Center(
                                      child:
                                      Text('HP',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 15)),)
                                ),
                                Container(
                                    height: 60,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black38),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)
                                      ),
                                    ),
                                    child: Center(
                                      child:
                                      Text('45',
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 15)),)
                                ),
                                SizedBox(width: 30,),
                                Container(
                                    height: 60,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black38),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)
                                      ),
                                    ),
                                    child: Center(
                                      child:
                                      Text('Type: Grass',
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 15)),)
                                ),
                              ],
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 5.0,top: 220,right: 5.0,bottom: 5.0),
                              child: Center(
                                child:  ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.black87,

                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.only(left: 110,right: 110,top: 20,bottom: 20),
                                          primary: Colors.white,
                                          textStyle: const TextStyle(fontSize: 17),
                                        ),
                                        onPressed: () {
                                          addNote(filtro[index].nombre, '', filtro[index].url_imagen,filtro[index].indices);
                                        },
                                        child: const Text('Yo te elijo!'),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 65,)
                  ]
              )
              );




            }

        )
    );

  }
  Future addNote( String title, String descripcion, String url,int id ) async {
    final note = Note(
      id: id,
      title: title,
      description: descripcion,
      url_imagen: url,
    );


      await NotesDatabase.instance.create(note);

  }
  
}